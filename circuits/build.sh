set -e

echo "Compiling circuit..."
if ! nargo compile; then
    echo "Compilation failed. Exiting..."
    exit 1
fi

echo "Generating vkey..."
bb write_vk_ultra_keccak_honk -b ./target/noir_solidity.json -o ./target/vk -c ~/.bb-crs

echo "Generating solidity verifier..."
bb contract_ultra_honk -k ./target/vk -c ~/.bb-crs -o ./target/Verifier.sol

echo "Done"
