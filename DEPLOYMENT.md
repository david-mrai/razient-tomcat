# Razient Tomcat Container - Deployment Guide

This document describes how the razient-tomcat container image is built and deployed to production.

## Overview

The razient-tomcat image packages:
- **Tomcat 11** with Java 25
- **Razient WAR application** (from razient-java build)
- **JEvolution Report Apps** (razresearch, RepSurveys, globalincidents)
- **MySQL Connector/J** database driver
- **Hardened server configuration** (no AJP, no manager, minimal exposure)

## Building the Image

### Prerequisites
- Docker with BuildKit support
- JDK 25 and Maven 3.9+ (for building razient-java)
- Razient WAR file from razient-java build

### Build Command

From the razient-tomcat directory:

```bash
# Build razient-java first
cd ../razient-java/Razient
mvn package

# Build the Docker image with the WAR
cd ../../razient-tomcat
docker build --build-context razient=../razient-java/Razient/target -t razient:latest .
```

This creates an image with:
- All dependencies and drivers pre-installed
- Razient application embedded in webapps/
- Non-root user (tomcat, uid 10001)
- Ready to run with environment variables

## Running the Container

### Basic Usage

```bash
docker run -d --name razient \
  -p 127.0.0.1:8080:8080 \
  -e RAZIENT_DB_URL=jdbc:mariadb://db.example.com:3306/razient \
  -e RAZIENT_DB_USERNAME=razient \
  -e RAZIENT_DB_PASSWORD=your-password \
  -v razient-data:/data \
  razient:latest
```

### Production Deployment

Use the provided docker-compose file:

```bash
# Copy environment template
cp .env.example .env

# Edit .env with production values
nano .env

# Deploy using docker-compose
docker-compose -f docker-compose.prod.yml up -d
```

Or with the GitHub Actions workflow (automatic on push to main):

```bash
# Push to main branch in razient-java repository
# GitHub Actions will:
# 1. Build the WAR
# 2. Build the Docker image
# 3. Deploy to mofu using self-hosted runner
```

## Environment Variables

All configuration comes from environment variables:

| Variable | Required | Default | Purpose |
|----------|----------|---------|---------|
| `RAZIENT_DB_URL` | Yes | - | JDBC connection URL |
| `RAZIENT_DB_USERNAME` | Yes | - | Database username |
| `RAZIENT_DB_PASSWORD` | Yes | - | Database password |
| `RAZIENT_DB_DRIVER` | No | `com.mysql.cj.jdbc.Driver` | Driver class (use `org.mariadb.jdbc.Driver` for MariaDB) |
| `RAZIENT_DB_POOL_SIZE` | No | `20` | Connection pool size |
| `RAZIENT_DB_SCHEMA_ACTION` | No | `none` | Hibernate schema action (`none`, `update`, `create`) |
| `RAZIENT_PUBLIC_BASE_URL` | No | `https://www.razient.com` | Base URL for absolute links |
| `RAZIENT_DATA_DIR` | No | `/data` | Directory for uploads and generated files |
| `RAZIENT_LOG_LEVEL` | No | `INFO` | Root log level |
| `RAZIENT_MAIL_FROM` | No | `default@unknown.com` | Outgoing mail sender |
| `RAZIENT_SMTP_*` | No | - | Mail server configuration |

See [razient-java README](../razient-java/README.md#settings) for complete configuration details.

## Deployment Workflows

### GitHub Actions (Recommended)

The `.github/workflows/deploy.yml` workflow in razient-java:

1. Triggers on push to main branch or workflow_dispatch
2. Runs on self-hosted runner "razient-prod" on mofu
3. Builds the WAR with Maven
4. Builds the Docker image
5. Deploys the container with:
   - Database credentials from GitHub secrets
   - Proper restart policy
   - Health checks
   - Persistent volume for uploads
6. Verifies deployment with health check

### Manual Deployment

To deploy manually on mofu:

```bash
# 1. Build the image
./build.sh

# 2. Setup environment
source .env

# 3. Deploy using docker-compose
docker-compose -f docker-compose.prod.yml up -d

# 4. Verify health
./health-check.sh
```

## Persistent Storage

The container uses a Docker volume for uploads and data:

```bash
# Create volume
docker volume create razient-data

# Copy existing data from old server (if upgrading)
docker run --rm -v razient-data:/data -v /path/to/old/data:/src \
  alpine cp -a /src/* /data/

# Inspect volume
docker volume inspect razient-data
```

## Networking

### Local Container Deployment
- Container listens on `127.0.0.1:8080` (internal only)
- No external exposure (security by design)
- Reverse proxy (daytona/Apache) provides TLS and routes requests

### Network Requirements
- Database connectivity to MariaDB server (3306)
- (Optional) SMTP server for outgoing mail
- (Optional) External APIs (Google Maps, OpenWeatherMap)

## Logs and Monitoring

### View Logs
```bash
# Recent logs
docker logs razient --tail=100

# Follow logs
docker logs -f razient

# Inside container
docker exec razient cat /usr/local/tomcat/logs/catalina.out
```

### Health Check

```bash
# Container health status
docker inspect --format='{{.State.Health.Status}}' razient

# Manual health check
docker exec razient curl -f http://127.0.0.1:8080/Razient/ || echo "Unhealthy"

# Via localhost
curl -fsS http://127.0.0.1:8080/Razient/ && echo "✓ Healthy"
```

### Monitoring
- Check logs regularly for errors
- Monitor database connection errors
- Track container restart frequency
- Monitor disk space (uploads directory)

## Updates and Patches

### Updating Razient Application

1. Push changes to razient-java main branch
2. GitHub Actions workflow automatically:
   - Builds new WAR
   - Creates new Docker image
   - Deploys to mofu

### Updating Base Image (Tomcat/Java)

To update the Tomcat or Java version:

1. Edit `Dockerfile` ARG `TOMCAT_IMAGE`
2. Rebuild locally first: `docker build ... -t razient:test`
3. Test thoroughly before deploying
4. Commit and push (triggers workflow)

### Emergency Rollback

```bash
# Stop current container
docker stop razient

# Run previous image
docker run -d --name razient ... razient:YYYYMMDD-HHMMSS

# Or restore from docker-compose
docker-compose -f docker-compose.prod.yml down
# Edit docker-compose to use previous image tag
docker-compose -f docker-compose.prod.yml up -d
```

## Troubleshooting

### Container won't start
```bash
docker logs razient
# Check for database connection errors, port conflicts, or insufficient memory
```

### Database connection errors
```bash
# Verify credentials and URL
docker exec razient env | grep RAZIENT_DB

# Test connection from container
docker exec razient \
  mysql -h database.host -u razient -p -e "SELECT VERSION();"
```

### Application errors
```bash
# Check application logs
docker exec razient tail -f /usr/local/tomcat/logs/catalina.out

# Check container processes
docker top razient

# Check resource usage
docker stats razient
```

### Port conflicts
```bash
# Check which process is using port 8080
lsof -i :8080
netstat -tlnp | grep 8080

# Free the port or use a different port
docker rm -f razient
docker run ... -p 127.0.0.1:18080:8080 ...
```

## Security Considerations

1. **Container runs as non-root user** (uid 10001)
2. **No AJP, shutdown port, or manager apps** in Tomcat config
3. **TLS termination at reverse proxy** (Apache on daytona)
4. **Database credentials from environment** (not in image)
5. **Error pages without stack traces** in production
6. **Read-only root filesystem** (if Docker security policy enabled)

## Performance Tuning

### JVM Heap Size

Edit `docker-entrypoint.sh` to set heap size:

```bash
export CATALINA_OPTS="-Xms512m -Xmx2048m"
```

### Connection Pool Size

Adjust in docker-compose or environment:

```bash
-e RAZIENT_DB_POOL_SIZE=30
```

### Tomcat Thread Pool

Edit `conf/server.xml` to adjust:

```xml
<Connector port="8080" maxThreads="200" minSpareThreads="10" />
```

## Compliance

- Follows OWASP Tomcat hardening guidelines
- Security headers configured (see razient-java README)
- Meets compliance requirements for database access
- Audit logging available via container logs

## Support and Documentation

- **Razient-java README**: Configuration, security, known issues
- **Docker documentation**: Container management, networking
- **Tomcat documentation**: Application server tuning, troubleshooting
- **GitHub Actions workflows**: CI/CD pipeline details

See DEPLOYMENT.md in razient-java for the complete production deployment guide.
