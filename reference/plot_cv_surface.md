# Plot the CV surface in 3D

Draws a perspective plot of the CV surface with all three solutions.

## Usage

``` r
plot_cv_surface(
  surface,
  configurations,
  theta = -35,
  phi = 25,
  target_slope = 1
)
```

## Arguments

- surface:

  Output of fit_cv_surface().

- configurations:

  Output of trial_configurations().

- theta, phi:

  Perspective viewing angles.

- target_slope:

  Positive target decrease in CV percentage points per basic unit along
  each coordinate for the marginal-efficiency solution.

## Value

Draws a base-R plot and returns invisibly.

## Examples

``` r
cfg <- trial_configurations(example_trial("rice"))
plot_cv_surface(fit_cv_surface(cfg), cfg)
```
