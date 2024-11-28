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

echo "Done"
