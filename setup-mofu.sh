#!/bin/bash
# Setup script for Razient production deployment on mofu
# Run this once to configure the deployment infrastructure

set -euo pipefail

echo "Razient Production Deployment Setup"
echo "===================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if running on mofu
if ! hostname -I | grep -q "10.0.0.34"; then
    echo -e "${YELLOW}Warning: This doesn't appear to be mofu (10.0.0.34)${NC}"
    read -p "Continue anyway? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# 1. Verify Docker is installed and running
echo -e "${GREEN}1. Checking Docker...${NC}"
if ! command -v docker &> /dev/null; then
    echo -e "${RED}Docker not found. Please install Docker first.${NC}"
    exit 1
fi

if ! docker ps &> /dev/null; then
    echo -e "${RED}Docker daemon is not running or not accessible.${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Docker is installed and running${NC}"
echo ""

# 2. Create Docker volume for Razient data
echo -e "${GREEN}2. Creating Docker volume for Razient data...${NC}"
if docker volume ls | grep -q razient-data; then
    echo "✓ Volume razient-data already exists"
else
    docker volume create razient-data
    echo "✓ Created volume razient-data"
fi
echo ""

# 3. Create razient network
echo -e "${GREEN}3. Creating Docker network...${NC}"
if docker network ls | grep -q razient-network; then
    echo "✓ Network razient-network already exists"
else
    docker network create razient-network
    echo "✓ Created network razient-network"
fi
echo ""

# 4. Verify database connectivity (if provided)
echo -e "${GREEN}4. Checking database configuration...${NC}"
if [ -f ".env" ]; then
    echo "✓ Found .env file"
    # Source the environment file to check variables
    set +u  # Allow unset variables temporarily
    source .env || true
    set -u
else
    echo -e "${YELLOW}⚠ No .env file found. Copy .env.example to .env and configure it.${NC}"
fi
echo ""

# 5. Create necessary directories
echo -e "${GREEN}5. Creating deployment directories...${NC}"
mkdir -p ~/razient-deploy
mkdir -p ~/razient-deploy/logs
echo "✓ Created ~/razient-deploy"
echo ""

# 6. Verify GitHub Actions runners
echo -e "${GREEN}6. GitHub Actions Runners Status${NC}"
echo "Configure these runners in your GitHub Actions settings:"
echo "  • Name: razient-prod"
echo "  • Labels: self-hosted, razient-prod"
echo "  • URL: https://github.com/david-mrai/razient-java"
echo ""

# 7. Check ports are available
echo -e "${GREEN}7. Checking required ports...${NC}"
PORTS_OK=true

if netstat -tlnp 2>/dev/null | grep -q ":8080 "; then
    echo -e "${YELLOW}⚠ Port 8080 already in use${NC}"
    PORTS_OK=false
else
    echo "✓ Port 8080 available"
fi

if netstat -tlnp 2>/dev/null | grep -q ":3021 "; then
    echo -e "${YELLOW}⚠ Port 3021 already in use${NC}"
    PORTS_OK=false
else
    echo "✓ Port 3021 available"
fi

if [ "$PORTS_OK" = false ]; then
    echo -e "${YELLOW}Some ports are in use. You may need to adjust configuration.${NC}"
fi
echo ""

# 8. Setup instructions
echo -e "${GREEN}8. Setup Instructions${NC}"
echo ""
echo "Next steps:"
echo ""
echo "1. Configure environment variables:"
echo "   cp .env.example .env"
echo "   # Edit .env with your database credentials"
echo ""
echo "2. Configure GitHub Action Secrets in the repository:"
echo "   https://github.com/david-mrai/razient-java/settings/secrets/actions"
echo ""
echo "   Required secrets:"
echo "   - RAZIENT_DB_URL"
echo "   - RAZIENT_DB_USERNAME"
echo "   - RAZIENT_DB_PASSWORD"
echo "   - RAZIENT_DB_DRIVER"
echo ""
echo "3. Register the self-hosted runners on mofu:"
echo "   Go to Settings → Actions → Runners → New self-hosted runner"
echo ""
echo "4. Start the deployment:"
echo "   Push to main branch or use workflow_dispatch in GitHub Actions"
echo ""
echo -e "${GREEN}Setup complete!${NC}"
