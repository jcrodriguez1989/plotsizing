# Simultaneous sectional curvature solution

Closed-form intersection of the two coordinate-section maximum-curvature
loci.

## Usage

``` r
simultaneous_sectional_curvature(a, m, n)
```

## Arguments

- a, m, n:

  Positive power-law surface parameters.

## Value

A one-row data frame with continuous dimensions, area, predicted CV, and
K.

## Examples

``` r
simultaneous_sectional_curvature(a = 22.95, m = 0.608, n = 0.232)
#>   criterion    width   length     area       cv          K
#> 1 sectional 4.599744 1.542093 7.093231 8.207275 0.02536104
```
