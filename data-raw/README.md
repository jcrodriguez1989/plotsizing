# Example uniformity trials

The four trials returned by `example_trial()` are stored as CSV files in `inst/extdata/`. Each file is the trial grid itself: one row per field row, one column per field column (headers `C1`, `C2`, ...), one yield value per basic unit. There is no processing step; `example_trial()` reads the files directly with `read_trial_matrix()`.

| File | Crop | Grid (rows x columns) | Basic units |
|---|---|---|---|
| `trial_rice.csv` | Rice (*Oryza sativa*) | 20 x 20 | 400 |
| `trial_maize.csv` | Maize (*Zea mays*) | 20 x 20 | 400 |
| `trial_common_bean.csv` | Nambi common bean (*Phaseolus vulgaris*) | 10 x 20 | 200 |
| `trial_cowpea.csv` | Cowpea (*Vigna unguiculata*) | 10 x 20 | 200 |

All four trials:

- Location: Guanacaste, Costa Rica.
- Basic unit: 1 m x 1 m, harvested separately, no treatments applied.

## Checksums

MD5 checksums of the files as distributed, to detect accidental edits:

```
43cea483c8b8a02752ecb19610b2b4fa  inst/extdata/trial_common_bean.csv
f9080f2067e350518af6987721417f73  inst/extdata/trial_cowpea.csv
1de4986535a19d18ee8707ae4c5c1ee7  inst/extdata/trial_maize.csv
4600792779e1a6fc28981ceb0808ee8e  inst/extdata/trial_rice.csv
```
