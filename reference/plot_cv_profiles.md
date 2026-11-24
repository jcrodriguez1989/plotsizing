# Plot empirical CV profiles

Shows CV against width and length with the power-law curves.

## Usage

``` r
plot_cv_profiles(configurations, surface)
```

## Arguments

- configurations:

  Output of trial_configurations().

- surface:

  Output of fit_cv_surface().

## Value

A ggplot object.

## Examples

``` r
cfg <- trial_configurations(example_trial("rice"))
plot_cv_profiles(cfg, fit_cv_surface(cfg))
```
