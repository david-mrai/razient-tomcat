#!/bin/bash
# Razient Deployment Health Check Script
# Run this to verify that both frontend and backend are running correctly

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}Razient Production Deployment Health Check${NC}"
echo "============================================="
echo ""

FAILED=0
PASSED=0

# Function to print test result
test_result() {
    local test_name=$1
    local result=$2
    local details=${3:-}

    if [ "$result" = "pass" ]; then
        echo -e "${GREEN}✓${NC} $test_name"
        ((PASSED++))
    else
        echo -e "${RED}✗${NC} $test_name"
        if [ -n "$details" ]; then
            echo "  └─ $details"
        fi
        ((FAILED++))
    fi
}

echo -e "${BLUE}1. Backend (Razient Tomcat)${NC}"
echo "---"

# Check if Razient container is running
if docker ps | grep -q "razient"; then
    test_result "Container running" "pass"
else
    test_result "Container running" "fail" "Container 'razient' is not running"
fi

# Check port 8080
if curl -fsS -o /dev/null http://127.0.0.1:8080/Razient/ 2>/dev/null; then
    test_result "Port 8080 accessible" "pass"
else
    test_result "Port 8080 accessible" "fail" "Cannot connect to http://127.0.0.1:8080/Razient/"
fi

# Check Tomcat health
if docker exec razient curl -fsS http://127.0.0.1:8080/Razient/ > /dev/null 2>&1; then
    test_result "Razient application responding" "pass"
else
    test_result "Razient application responding" "fail" "Tomcat not responding to requests"
fi

# Check database connectivity (by looking at logs)
if docker logs razient 2>&1 | grep -i "database\|connection\|hibernate" | grep -i error > /dev/null 2>&1; then
    test_result "Database connected" "fail" "Database errors in logs"
else
    test_result "Database connected" "pass"
fi

echo ""
echo -e "${BLUE}2. Frontend (Angular - rz)${NC}"
echo "---"

# Check if rz systemd service is running
if systemctl --user is-active rz &> /dev/null; then
    test_result "Systemd service running" "pass"
else
    test_result "Systemd service running" "fail" "Service 'rz' is not active"
fi

# Check port 3021
if curl -fsS -o /dev/null http://127.0.0.1:3021/ 2>/dev/null; then
    test_result "Port 3021 accessible" "pass"
else
    test_result "Port 3021 accessible" "fail" "Cannot connect to http://127.0.0.1:3021/"
fi

# Check if frontend is serving index.html
if curl -fsS http://127.0.0.1:3021/ | grep -q "index\|<!DOCTYPE\|<html"; then
    test_result "Frontend serving content" "pass"
else
    test_result "Frontend serving content" "fail" "Frontend not serving valid HTML"
fi

echo ""
echo -e "${BLUE}3. Docker Configuration${NC}"
echo "---"

# Check Docker volume
if docker volume ls | grep -q razient-data; then
    test_result "Data volume exists" "pass"
else
    test_result "Data volume exists" "fail" "Volume 'razient-data' not found"
fi

# Check Docker network
if docker network ls | grep -q razient-network; then
    test_result "Docker network exists" "pass"
else
    test_result "Docker network exists" "fail" "Network 'razient-network' not found"
fi

echo ""
echo -e "${BLUE}4. Ports and Network${NC}"
echo "---"

# Check that required ports are only bound locally
if netstat -tlnp 2>/dev/null | grep ":8080" | grep -q "127.0.0.1"; then
    test_result "Port 8080 bound locally" "pass"
elif netstat -tlnp 2>/dev/null | grep ":8080" | grep -q "0.0.0.0"; then
    test_result "Port 8080 bound locally" "fail" "Port is bound to 0.0.0.0 (should be 127.0.0.1)"
fi

if netstat -tlnp 2>/dev/null | grep ":3021" | grep -q "127.0.0.1"; then
    test_result "Port 3021 bound locally" "pass"
elif netstat -tlnp 2>/dev/null | grep ":3021" | grep -q "0.0.0.0"; then
    test_result "Port 3021 bound locally" "fail" "Port is bound to 0.0.0.0 (should be 127.0.0.1)"
fi

echo ""
echo -e "${BLUE}5. Integration Tests${NC}"
echo "---"

# Test API endpoint
if curl -fsS -o /dev/null -w "%{http_code}" http://127.0.0.1:8080/Razient/service/ws/country/ 2>/dev/null | grep -q "200\|404"; then
    test_result "REST API responding" "pass"
else
    test_result "REST API responding" "fail" "REST endpoints not responding"
fi

echo ""
echo "============================================="
echo -e "Results: ${GREEN}${PASSED} passed${NC}, ${RED}${FAILED} failed${NC}"
echo ""

if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}All checks passed! Deployment is healthy.${NC}"
    exit 0
else
    echo -e "${RED}Some checks failed. Review the errors above.${NC}"
    exit 1
fi
