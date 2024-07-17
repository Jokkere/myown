#!/bin/bash

# Define the paths to the files
sol_file="$HOME/infernet-container-starter/projects/hello-world/contracts/script/CallContract.s.sol"

# Run the deployment command and capture the output
deployment_output=$(project=hello-world make deploy-contracts)

# Print the full deployment output for debugging purposes
echo "Full deployment output:"
echo "$deployment_output"

# Extract the contract address from the deployment output
contract_address=$(echo "$deployment_output" | grep -oP 'Deployed SaysHello:\s*\K0x[a-fA-F0-9]{40}')

# Print the extracted contract address for debugging purposes
echo "Extracted contract address: $contract_address"

# Check if the contract address was found
if [ -z "$contract_address" ]; then
  echo "Contract address not found in the deployment output"
  exit 1
fi

# Debug: print the original content of the Solidity file
echo "Original Solidity file content:"
cat "$sol_file"

# Use sed to dynamically replace the address in the Solidity file
sed -i "s/0x[a-fA-F0-9]\{40\}/$contract_address/" "$sol_file"

# Debug: print the updated content of the Solidity file
echo "Updated Solidity file content:"
cat "$sol_file"

echo "Updated contract address in $sol_file"
