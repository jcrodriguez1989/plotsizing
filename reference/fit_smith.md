# Estimate Smith heterogeneity using weighted log variance

The main method is Smith (1938) WLS with weights M-1 and a free
intercept; b_prime applies to the finite observed field.

## Usage

``` r
fit_smith(
  configurations,
  method = c("smith1938", "nls", "log", "unweighted_log")
)
```

## Arguments

- configurations:

  Output of trial_configurations().

- method:

  smith1938 (default), nls, log, or unweighted_log.

## Value

A list with b_prime, model, weights, and fit diagnostics.

## Examples

``` r
cfg <- trial_configurations(example_trial("rice"))
fit_smith(cfg)$b_prime
#> [1] 0.8267914
```
