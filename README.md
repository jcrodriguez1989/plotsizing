# plotsizing

plotsizing estimates the size and shape of the experimental unit (plot) from agricultural uniformity trials. It fits a bivariate surface to the coefficient of variation (CV) of all plot configurations that can be formed from the trial, and derives plot width and length jointly from that surface.

Packages such as `agricolae`, `optsize` and `trialSizing` estimate plot size from the one-dimensional relation between CV and plot area, and choose the shape afterwards. plotsizing works on the two-dimensional surface instead, so size and shape come out of the same calculation.

## Installation

```r
# install.packages("remotes")
remotes::install_github("jcrodriguez1989/plotsizing")
```

## Example

The package includes four uniformity trials from Guanacaste, Costa Rica: rice and maize (20 x 20 basic units) and Nambí common bean and cowpea (10 x 20 basic units).

```r
library(plotsizing)

trial <- example_trial("rice")
result <- analyze_uniformity_trial(trial, criterion = "all")

result            # trial, Smith index, fitted surface and solutions
summary(result)   # adds descriptive statistics and standard errors
plot(result)      # CV contours with the three solutions
```

The vignette walks through a complete analysis: `vignette("plotsizing")`.

To analyse your own trial, save the yields as a CSV with one column per field column, a header row and no row-number column:

```csv
C1,C2,C3,C4
390,404,308,354
460,310,362,400
320,474,424,452
```

```r
trial <- read_trial_matrix("my_trial.csv")
result <- analyze_uniformity_trial(trial, unit_width_m = 1, unit_length_m = 1,
                                   criterion = "all")
```

`unit_width_m` and `unit_length_m` give the physical size of one basic unit and are only used to convert the results to metres.

## Methods

The CV surface

$$CV(x, y) = a\, x^{-m} y^{-n}$$

is fitted by nonlinear least squares, with `x` the plot width and `y` the plot length in basic units, and CV in percent. Three criteria are available, each with a closed-form solution:

- `"gaussian"`: the point of maximum Gaussian curvature of the surface.
- `"sectional"`: the point where the CV curves along width and along length both reach their maximum curvature, the two-dimensional version of the modified maximum-curvature method.
- `"marginal"`: the point where the CV decreases by `target_slope` percentage points per additional basic unit, both along width and along length.

The package also fits the Smith (1938) variance law by weighted least squares (weights `M - 1`, free intercept) and enumerates every exact rectangular partition of the trial with at least two plots.

All calculations use basic-unit coordinates and CV in percent. The results depend on that choice of scale, and on `target_slope` for the marginal criterion, so the continuous solutions should be compared with the plot configurations that are feasible in the field.

## Plots

`plot(result, which = ...)` draws `"contours"`, `"surface"`, `"sections"`, `"profiles"` or `"heatmap"`. The underlying functions can also be called directly:

```r
cfg <- result$configurations
surface <- result$surface

plot_trial_heatmap(trial)
plot_cv_profiles(cfg, surface)
plot_cv_contours(surface, cfg)
plot_cv_surface(surface, cfg)
plot_curvature_sections(surface, criterion = "all", configurations = cfg)
plot_multicrop_curvature()
```

## Citation

```r
citation("plotsizing")
```

The package was previously developed under the name `curvaUE`.
