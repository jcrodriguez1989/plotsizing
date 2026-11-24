# Load one of four example uniformity trials

Loads one of four uniformity trials carried out in Guanacaste, Costa
Rica: rice and maize (20 rows x 20 columns of basic units), Nambi common
bean (*Phaseolus vulgaris*) and cowpea (*Vigna unguiculata*) (10 rows x
20 columns). Each basic unit measures 1 m x 1 m and each cell holds its
yield.

## Usage

``` r
example_trial(crop = c("rice", "maize", "common_bean", "cowpea"))
```

## Source

The CSV files in `inst/extdata`; see `data-raw/README.md` in the package
source for their provenance.

## Arguments

- crop:

  One of `"rice"`, `"maize"`, `"common_bean"` or `"cowpea"`.

## Value

A numeric yield matrix whose rows and columns are the rows and columns
of the field.

## Examples

``` r
dim(example_trial("rice"))
#> [1] 20 20
```
