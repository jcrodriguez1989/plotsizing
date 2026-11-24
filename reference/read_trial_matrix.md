# Read an experimental yield grid from CSV or Windows clipboard

Accepts column headers only; rows are assigned internally. Returns a
numeric matrix.

## Usage

``` r
read_trial_matrix(path, sep = "auto", dec = "auto")
```

## Arguments

- path:

  CSV path or "clipboard" on Windows.

- sep:

  Column delimiter: auto, comma, semicolon, or tab.

- dec:

  Decimal point: auto, period, or comma.

## Value

A numeric matrix containing yields in their original spatial positions.

## Examples

``` r
path <- system.file("extdata", "trial_rice.csv", package = "plotsizing")
M <- read_trial_matrix(path)
dim(M)
#> [1] 20 20
```
