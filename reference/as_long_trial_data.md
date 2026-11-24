# Convert a spatial grid into long-format observations

Adds row and column indices without changing spatial cell positions.

## Usage

``` r
as_long_trial_data(trial)
```

## Arguments

- trial:

  Numeric yield matrix.

## Value

A data frame with row, column, and yield.

## Examples

``` r
head(as_long_trial_data(example_trial("cowpea")))
#>   row column yield
#> 1   1      1   104
#> 2   2      1   207
#> 3   3      1   145
#> 4   4      1    92
#> 5   5      1   149
#> 6   6      1   124
```
