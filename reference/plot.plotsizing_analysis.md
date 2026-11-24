# Plot a uniformity-trial analysis

Draws one of the package figures from an analysis, using the settings
stored in it (for example the marginal target slope).

## Usage

``` r
# S3 method for class 'plotsizing_analysis'
plot(
  x,
  which = c("contours", "surface", "sections", "profiles", "heatmap"),
  ...
)
```

## Arguments

- x:

  An object returned by
  [`analyze_uniformity_trial()`](https://www.elcancu.com/plotsizing/reference/analyze_uniformity_trial.md).

- which:

  Figure to draw: `"contours"` (default,
  [`plot_cv_contours()`](https://www.elcancu.com/plotsizing/reference/plot_cv_contours.md)),
  `"surface"`
  ([`plot_cv_surface()`](https://www.elcancu.com/plotsizing/reference/plot_cv_surface.md)),
  `"sections"`
  ([`plot_curvature_sections()`](https://www.elcancu.com/plotsizing/reference/plot_curvature_sections.md)),
  `"profiles"`
  ([`plot_cv_profiles()`](https://www.elcancu.com/plotsizing/reference/plot_cv_profiles.md))
  or `"heatmap"`
  ([`plot_trial_heatmap()`](https://www.elcancu.com/plotsizing/reference/plot_trial_heatmap.md)).

- ...:

  Further arguments passed to the plotting function.

## Value

A ggplot object, except for `which = "surface"`, which draws a base-R
plot and returns invisibly.

## Examples

``` r
result <- analyze_uniformity_trial(example_trial("rice"), criterion = "all")
plot(result)

plot(result, which = "sections")
```
