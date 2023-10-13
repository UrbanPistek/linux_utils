#!/bin/bash

echo "Starting with:"
df -h /

# clean docker
docker system prune --all

# Clean apts
sudo apt-get autoremove
sudo apt-get autoclean

echo "Ending with:"
df -h /

