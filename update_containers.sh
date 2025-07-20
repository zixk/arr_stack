#!/bin/bash
LOGFILE="/var/log/weekly_update/weekly_update_docker_$(date +\%Y-\%m-\%d_\%H-%M).log"
echo "=== Weekly update started at $(date) ===" >> "$LOGFILE"

cd /home/media/docker/arr_stack

docker compose pull >> "$LOGFILE" 2>&1
docker compose up -d >> "$LOGFILE" 2>&1
docker image prune -a -f >> "$LOGFILE" 2>&1

if [ $? -eq 0 ]; then
echo "Docker upgrade successful at $(date)" >> "$LOGFILE"
else
echo "Docker upgrade failed." >> "$LOGFILE"
fi