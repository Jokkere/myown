#!/bin/bash

# Run the token coins command with the hardcoded configuration path and capture its output
output=$(./qclient-2.0.2.3-linux-amd64 token coins --config $HOME/ceremonyclient/node/.config)

# Print the output for debugging (optional)
echo "Output from token coins command:"
echo "$output"

# Extract the first 15 coin addresses from the output
coin_addresses=($(echo "$output" | grep -oP '(?<=Coin )[a-fA-F0-9x]+' | head -n 13))

# Check if we have at least 15 coin addresses
if [[ ${#coin_addresses[@]} -eq 13 ]]; then
  # Construct the merge command with the first 15 coin addresses
  merge_command="./qclient-2.0.2.3-linux-amd64 token merge ${coin_addresses[@]} --config $HOME/ceremonyclient/node/.config"
  
  # Print and execute the merge command
  echo "Executing: $merge_command"
  eval $merge_command
else
  echo "Less than 15 coin addresses found. Merge command not executed."
fi
