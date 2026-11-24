# Describe a uniformity trial

Calculates descriptive statistics of basic-unit yields.

## Usage

``` r
describe_trial(trial)
```

## Arguments

- trial:

  Numeric yield matrix.

## Value

A one-row data frame of summary statistics.

## Examples

``` r
describe_trial(example_trial("maize"))
#>   n_ub rows columns    mean  std_dev    cv_ub minimum maximum skewness
#> 1  400   20      20 643.155 350.2508 54.45823      16    1808 0.436618
#>   excess_kurtosis
#> 1      -0.1374759
```
