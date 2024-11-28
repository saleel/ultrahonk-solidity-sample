echo "Compiling circuit..."
if ! nargo compile; then
    echo "Compilation failed. Exiting..."
    exit 1
fi

echo "Gate count:"
bb gates -b target/noir_solidity.json | jq  '.functions[0].circuit_size'

echo "Generating vkey..."
bb write_vk_ultra_honk -b ./target/noir_solidity.json -o ./target/vk

echo "Generating solidity verifier..."
bb contract_ultra_honk -k ./target/vk -c ~/.bb-crs -b ./target/noir_solidity.json -o ./target/Verifier.sol

echo "Generating proof..."
nargo execute 
bb prove_ultra_honk -b ./target/noir_solidity.json -w ./target/noir_solidity.gz -o ./target/proof

echo "Verifying proof..."
bb verify_ultra_honk -b ./target/noir_solidity.json -p ./target/proof -v ./target/vk

echo "Done"
