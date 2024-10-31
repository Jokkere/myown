#!/bin/bash

# Loop through numbers 1 to 200
for i in {1..200}; do
  # Define the path to the configuration file for the current number
  CONFIG_PATH="$HOME/ceremonyclient/node/$i/.config"

  # Check if the config file exists
  if [[ -d "$CONFIG_PATH" ]]; then
    # Run the token mint all command with the current config file and wait for it to complete
    echo "Running mint command for config $i..."
    ./qclient-2.0.2.3-linux-amd64 token mint all --config "$CONFIG_PATH"

    # Wait for the command to complete before moving to the next
    wait
  else
    echo "Configuration file not found at $CONFIG_PATH, skipping."
  fi
done
