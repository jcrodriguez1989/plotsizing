# Print a uniformity-trial analysis

Shows the trial size, the Smith index, the fitted CV surface and the
continuous solution of each criterion.

## Usage

``` r
# S3 method for class 'plotsizing_analysis'
print(x, digits = 3, ...)
```

## Arguments

- x:

  An object returned by
  [`analyze_uniformity_trial()`](https://www.elcancu.com/plotsizing/reference/analyze_uniformity_trial.md).

- digits:

  Number of significant digits to print.

- ...:

  Ignored.

## Value

`x`, invisibly.

## Examples

``` r
result <- analyze_uniformity_trial(example_trial("rice"))
print(result)
#> Uniformity-trial analysis (plotsizing)
#> 
#> Trial: 20 rows x 20 columns = 400 basic units of 1 x 1 m
#> Configurations: 35 (at least 2 plots each)
#> Smith (1938) b': 0.827
#> CV surface: CV = 22.95 * x^-0.608 * y^-0.232  (x = width, y = length, in basic units)
#> 
#> Solutions (width, length in m; area in m2; CV in %):
#>  criterion width length area   cv
#>   gaussian  4.34   1.45 6.28 8.63
#>  sectional  4.60   1.54 7.10 8.21
```
