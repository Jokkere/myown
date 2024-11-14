# Loop through numbers 1 to 200
for i in {1..1}; do
  # Define the path to the YAML file for the current number
  CONFIG_FILE="/root/ceremonyclient/node/$i/config.yml"

  # Check if the file exists
  if [[ -f "$CONFIG_FILE" ]]; then
    # Replace '/ip4/127.0.0.1/tcp/8337' with '""'
    sed -i 's|"/ip4/127.0.0.1/tcp/8337"|""|g' "$CONFIG_FILE"  
    # Replace '/ip4/127.0.0.1/tcp/8337' with '""'
    sed -i 's|/ip4/127.0.0.1/tcp/8337|""|g' "$CONFIG_FILE"
    # Replace '/ip4/127.0.0.1/tcp/8338' with '""'
    sed -i 's|/ip4/127.0.0.1/tcp/8338|""|g' "$CONFIG_FILE"
    # Replace '/ip4/0.0.0.0/udp/8336/quic' with '/ip4/0.0.0.0/tcp/8336'
    sed -i 's|/ip4/0.0.0.0/udp/8336/quic|/ip4/0.0.0.0/tcp/8336|g' "$CONFIG_FILE"

    echo "Replacement complete in $CONFIG_FILE."
  else
    echo "Configuration file not found at $CONFIG_FILE"
  fi
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
    ./qclient-2.0.2.3-linux-amd64 token transfer 0x19ad76f5bde2a0a9a6d2a0141c37bccac4f3992993bda738d9222b35f2b5c584 "$coin_address" --config "$CONFIG_PATH"
  else
    echo "Coin address not found in the output for config $i."
  fi
done
done
