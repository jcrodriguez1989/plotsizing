# Maximum Gaussian curvature solution

Closed-form maximum of Gaussian curvature for the separable power-law
surface.

## Usage

``` r
max_gaussian_curvature(a, m, n)
```

## Arguments

- a, m, n:

  Positive power-law surface parameters.

## Value

A one-row data frame with continuous dimensions, area, predicted CV, and
K.

## Examples

``` r
max_gaussian_curvature(a = 22.95, m = 0.608, n = 0.232)
#>   criterion    width   length     area       cv          K
#> 1  gaussian 4.334736 1.447803 6.275843 8.634254 0.02559633
```
