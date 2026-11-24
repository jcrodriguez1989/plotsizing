# Experimental-unit dimensions by two-dimensional marginal efficiency

Estimates the width and length of the experimental unit on the fitted
coefficient-of-variation surface by a coordinate-wise
marginal-efficiency criterion, as a closed-form alternative to the
curvature criteria.

## Usage

``` r
marginal_efficiency_2d(a, m, n, target_slope = 1)
```

## Arguments

- a, m, n:

  Positive parameters of the fitted coefficient-of-variation surface
  \\CV(x, y) = a\\x^{-m}\\y^{-n}\\, with `x` the width and `y` the
  length in basic units.

- target_slope:

  Positive target slope: the decrease in the coefficient of variation,
  in percentage points, per additional basic unit of the dimension
  considered. The same target is applied to width and length. Defaults
  to 1.

## Value

A one-row data frame with columns `criterion`, `width`, `length`, `area`
(all in basic units), `cv` (the predicted coefficient of variation at
the solution) and `K` (the Gaussian curvature of the surface at that
point).

## Details

The marginal decreases of the surface are \\-\partial CV / \partial x =
m\\CV / x\\ and \\-\partial CV / \partial y = n\\CV / y\\. Setting both
equal to `target_slope` yields a unique positive solution with closed
form \\x = (a\\m^{\\n+1} / (\tau\\n^{n}))^{1/(m+n+1)}\\, \\y =
(a\\n^{\\m+1} / (\tau\\m^{m}))^{1/(m+n+1)}\\ and length-to-width ratio
\\n/m\\. This is a marginal criterion by coordinates, not a
geometric-curvature criterion, and the result depends on the scale in
which the coefficient of variation and the dimensions are expressed; the
computation is in basic units and physical conversion is applied
afterwards.

## Examples

``` r
marginal_efficiency_2d(a = 22.95, m = 0.608, n = 0.232)
#>   criterion    width length     area       cv          K
#> 1  marginal 4.730084 1.8049 8.537331 7.779743 0.02394712
marginal_efficiency_2d(a = 22.95, m = 0.608, n = 0.232, target_slope = 0.5)
#>   criterion    width  length     area       cv          K
#> 1  marginal 6.894013 2.63061 18.13546 5.669419 0.01127319
```
