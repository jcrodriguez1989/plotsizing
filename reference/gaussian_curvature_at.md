# Gaussian curvature at a point

Calculates Gaussian curvature of z=a\*x^(-m)\*y^(-n).

## Usage

``` r
gaussian_curvature_at(a, m, n, x, y)
```

## Arguments

- a, m, n:

  Positive power-law surface parameters.

- x, y:

  Positive basic-unit coordinates.

## Value

A numeric Gaussian-curvature value.

## Examples

``` r
# Curvature at the maximum-Gaussian-curvature point of the rice surface
g <- max_gaussian_curvature(a = 22.95, m = 0.608, n = 0.232)
gaussian_curvature_at(a = 22.95, m = 0.608, n = 0.232, x = g$width, y = g$length)
#> [1] 0.02559633
# Reference case: the maximum of CV = 1 / (x * y) is 1/3 at (1, 1)
gaussian_curvature_at(a = 1, m = 1, n = 1, x = 1, y = 1)
#> [1] 0.3333333
```
