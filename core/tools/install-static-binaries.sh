#!/usr/bin/env bash
# Script to install tools that are simple static binaries

# Immediately exit on errors
set -e

# Remember to update Dockerfile to copy from multistage
TOOLS=(
    blueos_startup_update
    bridges
    linux2rest
    machineid
    mavlink2rest
    mavlink_camera_manager
    mavlink_server
    ttyd
    zenoh
)

parallel --halt now,fail=1 'RUNNING_IN_CI=true /home/pi/tools/{}/bootstrap.sh' ::: "${TOOLS[@]}"
