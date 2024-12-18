
A sample repo to verify UltraHonk circuit using a Solidity verifier.

nargo 0.38.0
bb 0.67.1

```ssh
(cd circuits && ./build.sh)

(cd js && npm install && ts-node split-proof.ts)

git submodule update && forge test --optimize --optimizer-runs 5000 --evm-version cancun --gas-report -vvv
```

