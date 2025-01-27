#!/bin/bash

# Check if the correct number of arguments is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 (activate|deactivate)"
  exit 1
fi

action="$1"

# Check the action and execute the appropriate command
case "$action" in
  activate)
    echo "Starting kanata.service..."
    sudo systemctl start kanata.service
    if [ $? -eq 0 ]; then
        echo "kanata.service started successfully."
    else
        echo "Failed to start kanata.service."
    fi
    ;;
  deactivate)
    echo "Stopping kanata.service..."
    sudo systemctl stop kanata.service
    if [ $? -eq 0 ]; then
        echo "kanata.service stopped successfully."
    else
        echo "Failed to stop kanata.service."
    fi
    ;;
  *)
    echo "Invalid action: $action"
    echo "Usage: $0 (activate|deactivate)"
    exit 1
    ;;
esac

exit 0