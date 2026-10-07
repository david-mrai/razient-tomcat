# razient-tomcat

Container image that runs Razient on Tomcat 11 (Java 25, Jakarta EE 11), together with the three
JEvolution report apps it embeds.

| Path | What it is |
| --- | --- |
| `Dockerfile` | Builds the image: Tomcat 11, MySQL Connector/J (pinned by SHA-256), the Razient WAR, the report apps. |
| `conf/server.xml` | Hardened server config: HTTP 8080 only (TLS ends at the front proxy), no AJP, no shutdown port, no manager apps, error pages without stack traces or version. |
| `conf/jELogicServer.conf`, `conf/LSLicense.lic`, `conf/media.properties` | JEvolution LogicServer settings and license, read by the report apps. |
| `webapps-javaee/` | The report apps `razresearch`, `RepSurveys`, `globalincidents` (closed-source JEvolution 3.6, Java EE / `javax.*`). Tomcat converts them to Jakarta EE into `webapps/` at startup (`legacyAppBase`). |
| `docker/gjt-driver-alias/` | `org.gjt.mm.mysql.Driver`, the old MySQL driver class name the report apps are configured with, delegating to Connector/J. |
| `docker-entrypoint.sh` | Writes the report apps' `objectPool.xml` from the `RAZIENT_DB_*` variables, then starts Tomcat. |
| `data/upload/` | Customer uploads carried over from the old server. Not part of the image: copy them into the `/data` volume. |

## Build

The Razient WAR comes from the `razient-java` repo:

```sh
(cd ../razient-java/Razient && mvn package)
docker build --build-context razient=../razient-java/Razient/target -t razient-tomcat .
```

## Run

```sh
docker run -d --name razient -p 127.0.0.1:8080:8080 \
  -e RAZIENT_DB_URL=jdbc:mysql://db:3306/razient \
  -e RAZIENT_DB_USERNAME=razient \
  -e RAZIENT_DB_PASSWORD=... \
  -v razient-data:/data \
  razient-tomcat
```

Apps: `/Razient/`, and the report apps under `/razresearch/jsp/`, `/RepSurveys/jsp/`, `/globalincidents/jsp/`
(Razient frames them from the same origin).

MySQL 8 must run with `lower_case_table_names=1` (the code mixes table-name case). The production database is
MariaDB 11.8 with the 2012 schema; upgrade it with `razient-java/migration-tools` (see its README) before
pointing Razient at it.

### Settings

| Variable | Used by | Purpose |
| --- | --- | --- |
| `RAZIENT_DB_URL`, `RAZIENT_DB_USERNAME`, `RAZIENT_DB_PASSWORD` | all apps | Database connection (required). |
| `RAZIENT_DB_DRIVER` | Razient | `org.mariadb.jdbc.Driver` for a MariaDB server (with a `jdbc:mariadb://` URL); default MySQL Connector/J. The report apps always use Connector/J, with the URL in `jdbc:mysql://` form. |
| `RAZIENT_PUBLIC_BASE_URL` | Razient | Public site address, e.g. `https://www.razient.com`, for absolute links such as the map icons in KML files. |
| `RAZIENT_DATA_DIR` | Razient | Uploads, charts, KML files; `/data` in the image. |
| `RAZIENT_DB_SCHEMA_ACTION` | Razient | Hibernate schema action, default `none`. |
| `RAZIENT_SMTP_*` | Razient | Outgoing mail. |
| `RAZIENT_*_JOB` | Razient | Turn the scheduled jobs on or off. |
| `RAZIENT_OPENWEATHERMAP_APPID`, `RAZIENT_GOOGLE_MAPS_KEY` | Razient | External API keys. |
| `RAZIENT_PUBLIC_UPLOAD_URL` | Razient | Public URL of the upload area, if not `/Razient/upload/`. |

## Behind the front proxy

The container speaks plain HTTP. The proxy terminates TLS and must send `X-Forwarded-For` and
`X-Forwarded-Proto` (Tomcat's `RemoteIpValve` trusts them from private addresses), so Razient
knows the request was HTTPS (HSTS, secure cookies).
