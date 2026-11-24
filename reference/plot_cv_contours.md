# Plot CV-surface contours

Displays fitted CV contours and the Gaussian, simultaneous sectional,
and coordinate-wise marginal-efficiency solutions. The axes are in basic
units.

## Usage

``` r
plot_cv_contours(surface, configurations, grid_size = 120, target_slope = 1)
```

## Arguments

- surface:

  Output of fit_cv_surface().

- configurations:

  Output of trial_configurations().

- grid_size:

  Number of grid points per axis.

- target_slope:

  Positive target decrease in CV percentage points per basic unit along
  either coordinate, for the marginal-efficiency solution.

## Value

A ggplot object. Points outside the displayed configuration range
correspond to extrapolation; the plotting window is extended to show
them.

## Examples

``` r
cfg <- trial_configurations(example_trial("rice"))
plot_cv_contours(fit_cv_surface(cfg), cfg)
```
