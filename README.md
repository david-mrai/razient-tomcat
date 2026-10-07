# razient-tomcat

Container image that runs Razient ([razient-java](https://github.com/david-mrai/razient-java)) on
Tomcat 11 with Java 25, together with the three JEvolution report apps Razient embeds. It replaces
the Windows Tomcat 6 installation that this repository used to contain. Not currently deployed.

## Razient repositories

| Repository | What it is |
| --- | --- |
| [rz](https://github.com/david-mrai/rz) | Angular compliance portal |
| [razient-java](https://github.com/david-mrai/razient-java) | Razient web application; its WAR goes into this image |
| **razient-tomcat** (this one) | Container image running Razient and the JEvolution report apps on Tomcat 11 |
| [razincident](https://github.com/david-mrai/razincident) | Razient Disaster Tracker: mobile app web services and admin panel (CakePHP 5) |
| [razient-files](https://github.com/david-mrai/razient-files) | Operations scripts: RSS incident import, database backups, data fixes |
| [RazientWebServices](https://github.com/david-mrai/RazientWebServices) | .NET 10 site and the RazientConnect client |
| [razient-src](https://github.com/david-mrai/razient-src) | Archived older snapshot of razient-java |

## What is in the image

| Path | What it is |
| --- | --- |
| `Dockerfile` | Tomcat 11 (`tomcat:11.0-jdk25-temurin`), MySQL Connector/J pinned by SHA-256, the Razient WAR, the report apps; runs as a non-root user (uid 10001) with OS updates applied |
| `conf/server.xml` | Hardened server config: HTTP 8080 only (TLS ends at the front proxy), no AJP, no shutdown port, no manager apps, no automatic redeploys, error pages without stack traces or version |
| `conf/jELogicServer.conf`, `conf/LSLicense.lic`, `conf/media.properties` | JEvolution LogicServer settings and license, read by the report apps |
| `webapps-javaee/` | The report apps `razresearch`, `RepSurveys`, `globalincidents` (closed-source JEvolution 3.6, Java EE / `javax.*`). Tomcat converts them to Jakarta EE into `webapps/` at startup (`legacyAppBase`). Their `objectPool.xml.template` holds the connection placeholders. |
| `docker/gjt-driver-alias/` | `org.gjt.mm.mysql.Driver`: the pre-2003 MySQL driver class name the report apps are configured with, delegating to Connector/J |
| `docker-entrypoint.sh` | Writes the report apps' `objectPool.xml` from `RAZIENT_DB_*`, then starts Tomcat |
| `data/upload/` | Customer uploads (142 MB) carried over from the old server. Not baked into the image: copy them into the `/data` volume. |

URLs served:

| Path | App |
| --- | --- |
| `/Razient/` | Razient customer and supplier login |
| `/Razient/razient.jsp` | Razient administrator login |
| `/Razient/service/...` | Razient REST services (including the mobile service under `/service/ws/`) |
| `/razresearch/jsp/`, `/RepSurveys/jsp/`, `/globalincidents/jsp/` | Report apps; Razient frames them from the same origin |

## Build

Requires Docker with BuildKit. The Razient WAR comes from razient-java:

```sh
(cd ../razient-java/Razient && mvn package)        # JDK 25, Maven 3.9+
docker build --build-context razient=../razient-java/Razient/target -t razient-tomcat .
```

## Run

```sh
docker run -d --name razient -p 127.0.0.1:8080:8080 \
  -e RAZIENT_DB_URL=jdbc:mariadb://db:3306/razient \
  -e RAZIENT_DB_DRIVER=org.mariadb.jdbc.Driver \
  -e RAZIENT_DB_USERNAME=razient \
  -e RAZIENT_DB_PASSWORD=... \
  -e RAZIENT_PUBLIC_BASE_URL=https://www.razient.com \
  -v razient-data:/data \
  razient-tomcat
```

For a MySQL server use a `jdbc:mysql://` URL and leave out `RAZIENT_DB_DRIVER`. MySQL 8 must run
with `lower_case_table_names=1`, because the code mixes table-name case.

Before the first start, copy the uploads into the data volume, e.g.
`docker run --rm -v razient-data:/data -v "$PWD/data":/src alpine cp -a /src/upload /data/`.

### Settings

| Variable | Used by | Purpose |
| --- | --- | --- |
| `RAZIENT_DB_URL`, `RAZIENT_DB_USERNAME`, `RAZIENT_DB_PASSWORD` | all apps | Database connection (required) |
| `RAZIENT_DB_DRIVER` | Razient | `org.mariadb.jdbc.Driver` for a MariaDB server (with a `jdbc:mariadb://` URL); default MySQL Connector/J. The report apps always use Connector/J and get the URL in `jdbc:mysql://` form. |
| `RAZIENT_PUBLIC_BASE_URL` | Razient | Public site address, e.g. `https://www.razient.com`, for absolute links such as the map icons in KML files |
| `RAZIENT_DATA_DIR` | Razient | Uploads, KML files, charts; `/data` in the image |
| `RAZIENT_DB_SCHEMA_ACTION` | Razient | Hibernate schema action, default `none`; keep it `none` for real data |
| `RAZIENT_SMTP_*`, `RAZIENT_MAIL_FROM` | Razient | Outgoing mail |
| `RAZIENT_*_JOB` | Razient | Turn the scheduled jobs on or off |
| `RAZIENT_OPENWEATHERMAP_APPID`, `RAZIENT_GOOGLE_MAPS_KEY` | Razient | External API keys |
| `RAZIENT_PUBLIC_UPLOAD_URL` | Razient | Public URL of the upload area, if not `/Razient/upload/` |

The razient-java README describes every Razient setting and the scheduled jobs.

## Database

The production database (mofu, MariaDB 11.8) is the 2012 schema. Upgrade it with the scripts in
razient-java's `migration-tools/` (see that README) before pointing this image at it, and back it up
first.

## Behind the front proxy

The container speaks plain HTTP. The proxy terminates TLS and must send `X-Forwarded-For` and
`X-Forwarded-Proto`. Tomcat's `RemoteIpValve` trusts them from private addresses, so Razient knows
the request was HTTPS (HSTS, secure cookies).

## Operations

- **Logs:** `docker logs razient` (Tomcat and Razient log to stdout). The access log is in
  `/usr/local/tomcat/logs/` inside the container.
- **Health check:** `curl -fsS http://127.0.0.1:8080/Razient/` returns the login page.
- **Updating:** rebuild the image with the new WAR, then replace the container. The `/data` volume
  keeps the uploads. The report apps are re-converted at every start.

## Troubleshooting

| Symptom | Cause |
| --- | --- |
| Razient fails to start with `Unknown column 'RESERVED'` | MariaDB server with MySQL Connector/J: set `RAZIENT_DB_DRIVER=org.mariadb.jdbc.Driver` and a `jdbc:mariadb://` URL |
| Pages fail with missing tables or columns (e.g. `profileuser`, `vw_rbiscss_short`) | The database is still the 2012 schema; run the razient-java migration scripts |
| Login returns to the login page | User has no assignment (`profileuser`) or contact row (`accountcustomer`/`accountsupplier`) |
| Report apps show connection errors | Check `RAZIENT_DB_*`; their pool is rewritten from them at each start |

## License

No license file is included. The JEvolution report apps and `LSLicense.lic` are third-party
(MCM Software) and licensed separately.
