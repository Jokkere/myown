#!/bin/bash

# Define the path to the YAML file
CONFIG_FILE="/root/ceremonyclient/node/.config/config.yml"

# Check if the file exists
if [[ -f "$CONFIG_FILE" ]]; then
  # Replace '/ip4/127.0.0.1/tcp/8337' with '""'
  sed -i 's|"/ip4/127.0.0.1/tcp/8337"|""|g' "$CONFIG_FILE"

  # Replace '.config/keys.yml' with '/root/ceremonyclient/node/.config/keys.yml'
  sed -i 's|.config/store|/root/ceremonyclient/node/.config/store|g' "$CONFIG_FILE"

  echo "Replacement complete."
else
  echo "Configuration file not found at $CONFIG_FILE"
fi