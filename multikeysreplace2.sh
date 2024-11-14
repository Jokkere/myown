# Loop through numbers 1 to 200
for i in {1..407}; do
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
done
