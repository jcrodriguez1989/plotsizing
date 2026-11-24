# Plot multi-crop CV contours and experimental-unit criteria

Creates faceted CV contours and the two sectional-curvature loci. Marks
the Gaussian, simultaneous sectional, and marginal-efficiency solutions.
The dashed guides and numerical labels refer only to the sectional
solution.

## Usage

``` r
plot_multicrop_curvature(
  trials = NULL,
  min_plots = 2L,
  unit_width_m = 1, unit_length_m = 1,
  cv_interval = 5, grid_size = 180L, target_slope = 1
)
```

## Arguments

- trials:

  Named list of trial matrices. NULL uses the four example crops.

- min_plots:

  Minimum number of experimental units per configuration.

- unit_width_m, unit_length_m:

  Physical dimensions of one basic unit, in metres.

- cv_interval:

  CV contour interval in percentage points.

- grid_size:

  Number of grid points per axis.

- target_slope:

  Positive target CV decrease (percentage points per basic unit) for the
  marginal-efficiency criterion.

## Value

A faceted ggplot object.

## Examples

``` r
plot_multicrop_curvature()
```
