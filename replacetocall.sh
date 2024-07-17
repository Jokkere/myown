#!/bin/bash

# Define the paths to the files
json_file="/root/infernet-container-starter/projects/hello-world/contracts/broadcast/Deploy.s.sol/8453/run-latest.json"
sol_file="$HOME/infernet-container-starter/projects/hello-world/contracts/script/CallContract.s.sol"

# Extract the contract address from the JSON file
contract_address=$(grep -oP '"contractAddress":\s*"\K[^"]+' "$json_file" | head -n 1)

# Print the extracted contract address for debugging purposes
echo "Extracted contract address: $contract_address"

# Check if the contract address was found
if [ -z "$contract_address" ]; then
  echo "Contract address not found in $json_file"
  exit 1
fi

# Use awk to replace the address in the Solidity file
awk -v old="0x13D69Cf7d6CE4218F646B759Dcf334D82c023d8e" -v new="$contract_address" '
{
  # Replace only the exact old address and ensure no duplication
  sub(old, new)
  print
}
' "$sol_file" > "$sol_file.tmp" && mv "$sol_file.tmp" "$sol_file"

echo "Updated contract address in $sol_file"
