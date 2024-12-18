#!/bin/bash

# Loop through numbers 1 to 5
for i in {2..20}; do
  # Define the path to the configuration directory for the current number
  CONFIG_PATH="$HOME/ceremonyclient/node/$i"

  # Run the initial command and capture its output
  output=$(./qclient-2.0.2.3-linux-amd64 token coins --config "$CONFIG_PATH")

  # Print the output for debugging (optional)
  echo "Output for config $i:"
  echo "$output"

  # Extract the coin address using grep and sed
  coin_address=$(echo "$output" | grep -oP '(?<=Coin )[a-fA-F0-9x]+')

  # Check if a coin address was found
  if [[ -n "$coin_address" ]]; then
    echo "Coin address found: $coin_address for config $i"
    
    # Run the transfer command with the extracted coin address
    ./qclient-2.0.2.3-linux-amd64 token transfer 0x2217ab3c4a816cdd9fd8371c22fac9340635a73b387067669f6271d6c49aa2e1 "$coin_address" --config "$CONFIG_PATH"
  else
    echo "Coin address not found in the output for config $i."
  fi
done
