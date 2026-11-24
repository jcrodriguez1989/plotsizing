# Summarize a uniformity-trial analysis

Collects the descriptive statistics of the basic units, the Smith
estimate, the fitted CV-surface parameters with their standard errors
and the solutions of each criterion. The standard errors come from the
nonlinear least-squares fit and are approximate: the configurations are
built from the same basic units, so their CVs are not independent.
p-values are therefore not reported.

## Usage

``` r
# S3 method for class 'plotsizing_analysis'
summary(object, ...)

# S3 method for class 'summary.plotsizing_analysis'
print(x, digits = 3, ...)
```

## Arguments

- object:

  An object returned by
  [`analyze_uniformity_trial()`](https://www.elcancu.com/plotsizing/reference/analyze_uniformity_trial.md).

- ...:

  Ignored.

- x:

  An object of class `summary.plotsizing_analysis`.

- digits:

  Number of significant digits to print.

## Value

An object of class `summary.plotsizing_analysis`, a list with
`descriptives`, `smith`, `surface` (parameter table), `rmse`, `solution`
and `settings`.

## Examples

``` r
result <- analyze_uniformity_trial(example_trial("rice"), criterion = "all")
summary(result)
#> Basic-unit yields:
#>  n_ub rows columns  mean std_dev cv_ub minimum maximum skewness excess_kurtosis
#>   400   20      20 429.6   95.69 22.27     166     704   0.2242         -0.2775
#> 
#> Smith (1938) variance law:
#>     method b_prime n_configurations
#>  smith1938   0.827               35
#> 
#> CV surface CV = a * x^-m * y^-n (nonlinear least squares):
#>   Estimate Std. Error
#> a   22.954     0.6007
#> m    0.608     0.0216
#> n    0.232     0.0165
#> Standard errors are approximate: configurations share basic units.
#> Descriptive RMSE: 0.834 CV points
#> 
#> Solutions (width, length in m; area in m2; CV in %):
#>  criterion width length area   cv
#>   gaussian  4.34   1.45 6.28 8.63
#>  sectional  4.60   1.54 7.10 8.21
#>   marginal  4.73   1.81 8.54 7.78
#> Marginal target slope: 1 CV points per basic unit
```
