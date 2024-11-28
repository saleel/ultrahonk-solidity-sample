

```ssh
cd circuits
./build.sh

cd js
npm install
ts-node split-proof.ts

cd ..
forge test --optimize --optimizer-runs 5000 --evm-version london --gas-report -vvv
```
