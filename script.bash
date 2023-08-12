#!/bin/bash

logging="$HOME/logging"

mkdir -p "$logging"

CombinedLog="$logging/cumulative-kernel-logs.txt"
CompressedCombinedLog="$logging/cumulative-kernel-logs.tar.bz2"


    CurrentDate=$(date +"%Y-%m-%dT%H-%M")

    LogFilename="$logging/kernel-logs_${CurrentDate}.txt"
    CompressedFilename="$logging/kernel-logs_${CurrentDate}.tar.bz2"

    journalctl --system --since "1 hour ago" > "$LogFilename"
    cat "$LogFilename" >> "$CombinedLog"
    tar -cvjf "$CompressedFilename" "$LogFilename"
    tar --append -f "$CompressedCombinedLog" "$LogFilename"
    dbxcli put "$CompressedCombinedLog" "/Dropbox/logs/"
    rm "$CompressedFilename" "$LogFilename"

