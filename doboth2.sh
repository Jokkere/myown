#!/bin/bash

# Loop through numbers 1 to 402
for i in {35..402}; do
  # Define the path to the configuration directory and file for the current number
  CONFIG_PATH="$HOME/ceremonyclient/node/$i/.config"
  CONFIG_FILE="$CONFIG_PATH/config.yml"
  
  # Check if the config file exists
  if [[ -f "$CONFIG_FILE" ]]; then
    # Perform replacements in config.yml
    sed -i 's|/ip4/127.0.0.1/tcp/8337|""|g' "$CONFIG_FILE"
    sed -i "s|.config/store|/root/ceremonyclient/node/$i/.config/store|g" "$CONFIG_FILE"
    
    echo "Replacement complete in $CONFIG_FILE."

    # Check if the config directory exists and run the mint command
    if [[ -d "$CONFIG_PATH" ]]; then
      echo "Running mint command for config directory $i..."
      ./qclient-2.0.2.3-linux-amd64 token mint all --config "$CONFIG_PATH"
      
      # Wait for the command to complete before moving to the next
      wait
    else
      echo "Configuration directory not found at $CONFIG_PATH, skipping."
    fi
  else
    echo "Configuration file not found at $CONFIG_FILE, skipping."
  fi
done
