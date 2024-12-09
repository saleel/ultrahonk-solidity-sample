echo "Compiling circuit..."
if ! nargo compile; then
    echo "Compilation failed. Exiting..."
    exit 1
fi

echo "Gate count:"
bb gates -b target/noir_solidity.json | jq  '.functions[0].circuit_size' -v

echo "Generating vkey..."
bb write_vk_ultra_keccak_honk -b ./target/noir_solidity.json -o ./target/vk -c ~/.bb-crs -v

echo "Generating solidity verifier..."
bb contract_ultra_honk -k ./target/vk -c ~/.bb-crs -o ./target/Verifier.sol -v

echo "Generating proof..."
nargo execute 
bb prove_ultra_keccak_honk -b ./target/noir_solidity.json -w ./target/noir_solidity.gz -o ./target/proof -c ~/.bb-crs -v
bb proof_as_fields_honk -k ./target/vk -p ./target/proof -c ~/.bb-crs -v

echo "Verifying proof..."
bb verify_ultra_keccak_honk -k ./target/vk -p ./target/proof -b ./target/noir_solidity.json -c ~/.bb-crs -v

echo "Done"
