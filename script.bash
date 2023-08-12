#!/bin/bash

logging="$HOME/logging"

mkdir -p "$logging"

CurrentDate=$(date +"%Y-%m-%dT%H-%M")

LogFilename="$logging/kernel-logs_${CurrentDate}.txt"
CompressedFilename="$logging/kernel-logs_${CurrentDate}.tar.bz2"

journalctl --since "1 hour ago" -k > "$LogFilename"
tar -cvjf "$CompressedFilename" "$LogFilename"
dbxcli put "$CompressedFilename" "/Dropbox/logs/"

