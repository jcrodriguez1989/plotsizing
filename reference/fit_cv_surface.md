# Fit a bivariate power-law CV surface

Fits CV=a\*width^(-m)\*length^(-n) by unweighted nonlinear least
squares, with dimensions in basic units.

## Usage

``` r
fit_cv_surface(configurations)
```

## Arguments

- configurations:

  Output of trial_configurations().

## Value

A list with a, m, n, model, residuals, and descriptive RMSE.

## Examples

``` r
cfg <- trial_configurations(example_trial("rice"))
surface <- fit_cv_surface(cfg)
surface[c("a", "m", "n")]
#> $a
#> [1] 22.95414
#> 
#> $m
#> [1] 0.6081412
#> 
#> $n
#> [1] 0.2321577
#> 
```
