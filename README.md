### Introduction

A sample repo to verify UltraHonk circuit using a Solidity verifier.


### Running locally

```ssh
# nargo 0.38.0
# bb 0.67.1

(cd circuits && ./build.sh)

(cd js && npm install)
(cd js && ts-node split-proof.ts)

git submodule update
forge test --optimize --optimizer-runs 5000 --evm-version cancun --gas-report -vvv

```

### Deployment

Deploying to base Sepolia:

```
forge script script/Deploy.s.sol:DeployScript --rpc-url https://sepolia.base.org --broadcast --legacy
```
Deployment output:
```
Verifier deployed at: 0x519845DF3Ead9be1B1217d422f5b40a4d43e737D
Starter deployed at: 0xaf78eFEf8B958eBa80D64e78fdBE655DC58e133b
Total Paid: 0.00000522658568628 ETH (5224287 gas * avg 0.00100044 gwei)
```


### Verifying Proof onchain

Verify proof on base Sepolia:

```
forge script script/VerifyProof.s.sol:VerifyProofScript --rpc-url https://sepolia.base.org --broadcast --legacy
```
Here is a [sample tx](https://sepolia.basescan.org/tx/0xeac8eacbc777bbf55fb15f502c94d9cc7f164aa46e1ea356bbfc98fb32e3b6ff) - Transaction Fee:
`0.000011818559069182 ETH ($0.02)`

