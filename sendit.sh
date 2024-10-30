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
  ./qclient-2.0.2.3-linux-amd64 token transfer 0x0f28e47ba140f9f1d4d4c1129ab0acbfded4c6a90422ffccb4ee70728ec4fb3c "$coin_address" --config $HOME/ceremonyclient/node/.config
else
  echo "Coin address not found in the output."
fi
