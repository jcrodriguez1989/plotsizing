# CRAN submission comments — plotsizing 0.3.3

## Submission

This would be the first submission of `plotsizing` to CRAN.

## Previously completed checks (different source version: 0.3.2)

- Windows 11, R 4.5.1: 0 ERRORs, 0 WARNINGs, 1 NOTE in incoming checks (new submission and initially invalid URLs/DOI).
- R-hub: Ubuntu Release (R 4.6.2), Linux (R-devel), macOS Intel (R-devel), macOS ARM64 (R-devel): each `Status: OK`, 99 testthat passes.
- These results **are not validation of version 0.3.3**.

## Changes in 0.3.3

- New coordinate-wise marginal-efficiency method and tests, plus integration into numeric output and visualization.
- Preserve existing positional arguments by appending `target_slope` after `smith_method`.
- Update documentation, README and NEWS; Smith DOI corrected.
- Preserve author and maintainer metadata supplied in the 0.3.3 source package.
- No repository URL is claimed until it becomes publicly accessible.

## Checks required on this exact final version

- [ ] Execute tests/testthat on installed package.
- [ ] R CMD build followed by R CMD check --as-cran with incoming checks enabled and manual PDF enabled (requires LaTeX).
- [ ] Run on CRAN-like Linux and macOS environments (R-hub or equivalent).
- [ ] Replace these entries with the resulting actual status before submitting.

The first-submission NOTE may be expected. Do not claim previously reported test results apply to this revised source.
