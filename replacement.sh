#!/bin/bash

# Define the file paths
makefile_path="$HOME/infernet-container-starter/projects/hello-world/contracts/Makefile"
config_json_path="$HOME/infernet-container-starter/deploy/config.json"
deploy_script_path="$HOME/infernet-container-starter/projects/hello-world/contracts/script/Deploy.s.sol"

# Define the search and replacement strings for the Makefile
search_string_rpc="RPC_URL := http://localhost:8545"
replacement_string_rpc="RPC_URL := https://base-rpc.publicnode.com/"

search_string_hex="0x5de4111afa1a4b94908f83103eb1f1706367c2e68ca870fc3fb9a804cdab365a"

# Check if the replacement parameter for the hex string is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <hex_replacement>"
  exit 1
fi

# Assign the hex replacement string
replacement_string_hex="0x$1"

# Replace strings in Makefile
if [ -f "$makefile_path" ]; then
  # Replace RPC URL in Makefile
  sed -i "s|$search_string_rpc|$replacement_string_rpc|g" "$makefile_path"
  # Replace hex string in Makefile
  sed -i "s|$search_string_hex|$replacement_string_hex|g" "$makefile_path"
  echo "Makefile replacement completed successfully."
else
  echo "Makefile not found: $makefile_path"
fi

# Define the search and replacement strings for config.json
search_string_rpc_json="http://host.docker.internal:8545"
replacement_string_rpc_json="https://base-rpc.publicnode.com/"

search_string_address_1="0x663F3ad617193148711d28f5334eE4Ed07016602"
replacement_string_address_1="0x3B1554f346DFe5c482Bb4BA31b880c1C18412170"

search_string_address_2="0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d"
replacement_string_address_2="0x$1"

# Replace strings in config.json
if [ -f "$config_json_path" ]; then
  # Replace RPC URL in config.json
  sed -i "s|$search_string_rpc_json|$replacement_string_rpc_json|g" "$config_json_path"
  # Replace first address in config.json
  sed -i "s|$search_string_address_1|$replacement_string_address_1|g" "$config_json_path"
  # Replace second address in config.json
  sed -i "s|$search_string_address_2|$replacement_string_address_2|g" "$config_json_path"
  echo "config.json replacement completed successfully."
else
  echo "config.json not found: $config_json_path"
fi

# Define the search and replacement strings for Deploy.s.sol
search_string_address_deploy="0x663F3ad617193148711d28f5334eE4Ed07016602"
replacement_string_address_deploy="0x3B1554f346DFe5c482Bb4BA31b880c1C18412170"

# Replace strings in Deploy.s.sol
if [ -f "$deploy_script_path" ]; then
  # Replace address in Deploy.s.sol
  sed -i "s|$search_string_address_deploy|$replacement_string_address_deploy|g" "$deploy_script_path"
  echo "Deploy.s.sol replacement completed successfully."
else
  echo "Deploy.s.sol not found: $deploy_script_path"
fi
