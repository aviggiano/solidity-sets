# solidity-sets

Solidity sets

## Setup

Install [foundry](https://github.com/foundry-rs/foundry) and clone this repository to run.

## Benchmark

Run tests with

```
forge test --gas-report
```

Results

```
| src/OpenZeppelinBitMaps.sol:OpenZeppelinBitMaps contract |                 |      |        |       |         |
|----------------------------------------------------------|-----------------|------|--------|-------|---------|
| Deployment Cost                                          | Deployment Size |      |        |       |         |
| 209451                                                   | 1078            |      |        |       |         |
| Function Name                                            | min             | avg  | median | max   | # calls |
| add                                                      | 725             | 7223 | 1006   | 44806 | 7       |
| at                                                       | 1426            | 3318 | 2789   | 6535  | 6       |
| cardinality                                              | 347             | 347  | 347    | 347   | 2       |
| contains                                                 | 547             | 547  | 547    | 547   | 14      |
| remove                                                   | 753             | 961  | 1031   | 1031  | 7       |


| src/OpenZeppelinEnumerableSet.sol:OpenZeppelinEnumerableSet contract |                 |       |        |       |         |
|----------------------------------------------------------------------|-----------------|-------|--------|-------|---------|
| Deployment Cost                                                      | Deployment Size |       |        |       |         |
| 221063                                                               | 1136            |       |        |       |         |
| Function Name                                                        | min             | avg   | median | max   | # calls |
| add                                                                  | 494             | 41828 | 45067  | 66967 | 7       |
| at                                                                   | 761             | 761   | 761    | 761   | 6       |
| cardinality                                                          | 436             | 436   | 436    | 436   | 2       |
| contains                                                             | 576             | 576   | 576    | 576   | 14      |
| remove                                                               | 527             | 1325  | 1143   | 1773  | 7       |
```
