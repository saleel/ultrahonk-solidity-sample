# Repro

```ssh
(cd circuits && ./build.sh)

(cd js && sudo npm install && ts-node split-proof.ts)

git submodule update && forge test --optimize --optimizer-runs 5000 --evm-version cancun --gas-report -vvv
```

