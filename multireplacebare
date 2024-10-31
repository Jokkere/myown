# Loop through numbers 1 to 200
for i in {1..200}; do
  # Define the path to the YAML file for the current number
  CONFIG_FILE="/root/ceremonyclient/node/$i/config.yml"

  # Check if the file exists
  if [[ -f "$CONFIG_FILE" ]]; then
    # Replace '/ip4/127.0.0.1/tcp/8337' with '""'
    sed -i 's|/ip4/127.0.0.1/tcp/8337|""|g' "$CONFIG_FILE"

    # Replace '.config/store' with '/root/ceremonyclient/node/<number>/store', where <number> is the current value of i
    sed -i "s|.config/store|/root/ceremonyclient/node/$i/store|g" "$CONFIG_FILE"

    echo "Replacement complete in $CONFIG_FILE."
  else
    echo "Configuration file not found at $CONFIG_FILE"
  fi
done
