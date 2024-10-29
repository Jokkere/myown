#!/bin/bash

# Run the initial command and capture its output
output=$(./qclient-2.0.2.3-linux-amd64 token coins --config $HOME/ceremonyclient/node/.config)

# Print the output for debugging (optional)
echo "$output"

# Extract the coin address using grep and sed
coin_address=$(echo "$output" | grep -oP '(?<=Coin )[a-fA-F0-9x]+')

# Check if a coin address was found
if [[ -n "$coin_address" ]]; then
  echo "Coin address found: $coin_address"
  
  # Run the transfer command with the extracted coin address
  ./qclient-2.0.2.3-linux-amd64 token transfer 0x19aaabcbd3f47ef7aa2fe4d4a81e3d8fcaa6391d3b64af75ed98353c44a53c0b "$coin_address" --config $HOME/ceremonyclient/node/.config
else
  echo "Coin address not found in the output."
fi
