#!/bin/bash

# Define the paths to the files
json_file="/root/infernet-container-starter/projects/hello-world/contracts/broadcast/Deploy.s.sol/8453/run-latest.json"
sol_file="~/infernet-container-starter/projects/hello-world/contracts/script/CallContract.s.sol"

# Extract the contract address from the JSON file
contract_address=$(grep -oP '"contractAddress":\s*"\K[^"]+' "$json_file")

# Check if the contract address was found
if [ -z "$contract_address" ]; then
  echo "Contract address not found in $json_file"
  exit 1
fi

# Update the .sol file with the new contract address
sed -i "s/0x13D69Cf7d6CE4218F646B759Dcf334D82c023d8e/$contract_address/" "$sol_file"

echo "Updated contract address in $sol_file"
