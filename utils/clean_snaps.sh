#!/bin/bash
# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
echo "Current Usage:" 

du -h /var/lib/snapd/snaps

set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done

echo "New Usage:"

du -h /var/lib/snapd/snaps

