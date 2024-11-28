# Repro

```ssh
(cd circuits && ./build.sh)

(cd js && npm install && ts-node split-proof.ts)

git submodule update && forge test --optimize --optimizer-runs 5000 --evm-version london --gas-report -vvv
```


## Status: Failing

```
Ran 1 test suite in 112.24ms (8.24ms CPU time): 0 tests passed, 1 failed, 0 skipped (1 total tests)

Failing tests:
Encountered 1 failing test in test/Starter.t.sol:StarterTest
[FAIL. Reason: SumcheckFailed()] testVerifyProof() (gas: 775596)
```