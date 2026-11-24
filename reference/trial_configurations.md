# Enumerate admissible experimental-unit geometries

Forms all exact rectangular and square partitions with at least two
experimental units. Smith uses sample variance regardless of the
optional CV denominator.

## Usage

``` r
trial_configurations(
  trial, unit_width_m = 1, unit_length_m = 1,
  sd = c("sample", "population"), min_plots = 2L
)
```

## Arguments

- trial:

  Numeric yield matrix.

- unit_width_m, unit_length_m:

  Physical basic-unit width and length in metres; used only to convert
  the output.

- sd:

  sample (default) or population for descriptive CV.

- min_plots:

  Minimum number of experimental units per configuration (at least 2).

## Value

A data frame of configurations, conventional and auxiliary variances,
and CVs.

## Examples

``` r
cfg <- trial_configurations(example_trial("rice"))
nrow(cfg)
#> [1] 35
head(cfg[, c("width_ub", "length_ub", "n_plots", "cv")])
#>   width_ub length_ub n_plots       cv
#> 1        1         1     400 22.27314
#> 2        2         1     200 14.88316
#> 3        1         2     200 18.99070
#> 4        4         1     100 10.93494
#> 5        2         2     100 12.70863
#> 6        1         4     100 16.23085
```
