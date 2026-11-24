#' Analyze an experimental uniformity trial
#'
#' Integrates input checks, configurations, a weighted Smith estimate,
#' CV-surface fitting, and the selected curvature or marginal-efficiency
#' solution(s).
#' @param trial Numeric yield matrix.
#' @param unit_width_m,unit_length_m Physical dimensions of one basic unit, in metres.
#' @param sd Either `"sample"` or `"population"`, for the descriptive CV.
#' @param min_plots Minimum number of experimental units per configuration
#'   (at least two).
#' @param criterion Either `"both"` (default; Gaussian and sectional),
#'   `"gaussian"`, `"sectional"`, `"marginal"`, or `"all"` (the three criteria).
#' @param smith_method Smith estimator method; `"smith1938"` by default.
#' @param target_slope Positive target decrease of the CV, in percentage points
#'   per basic unit along each coordinate. Used when `criterion` is
#'   `"marginal"` or `"all"`; default 1.
#' @return A list with `descriptives`, `dimensions`, `long_data`, `smith`,
#'   `surface`, `configurations`, `solution` and `basic_unit_dimensions_m`.
#'   The solution includes widths and lengths in basic units and in metres.
#' @examples
#' result <- analyze_uniformity_trial(example_trial("rice"), criterion = "all")
#' result$solution
#' @usage
#' analyze_uniformity_trial(
#'   trial, unit_width_m = 1, unit_length_m = 1,
#'   sd = "sample", min_plots = 2L,
#'   criterion = c("both", "gaussian", "sectional", "marginal", "all"),
#'   smith_method = c("smith1938", "nls", "log", "unweighted_log"),
#'   target_slope = 1
#' )
#' @export
analyze_uniformity_trial <- function(trial, unit_width_m = 1, unit_length_m = 1,
                                     sd = "sample", min_plots = 2L,
                                     criterion = c(
                                       "both", "gaussian", "sectional", "marginal", "all"
                                     ),
                                     smith_method = c("smith1938", "nls", "log", "unweighted_log"),
                                     target_slope = 1) {
  criterion <- match.arg(criterion)
  smith_method <- match.arg(smith_method)
  M <- .validate_trial(trial)
  cfg <- trial_configurations(M, unit_width_m, unit_length_m, sd, min_plots)
  smith <- fit_smith(cfg, method = smith_method)
  sup <- fit_cv_surface(cfg)
  sol <- switch(criterion,
    gaussian = max_gaussian_curvature(sup$a, sup$m, sup$n),
    sectional = simultaneous_sectional_curvature(sup$a, sup$m, sup$n),
    marginal = marginal_efficiency_2d(sup$a, sup$m, sup$n, target_slope),
    both = rbind(
      max_gaussian_curvature(sup$a, sup$m, sup$n),
      simultaneous_sectional_curvature(sup$a, sup$m, sup$n)
    ),
    all = rbind(
      max_gaussian_curvature(sup$a, sup$m, sup$n),
      simultaneous_sectional_curvature(sup$a, sup$m, sup$n),
      marginal_efficiency_2d(sup$a, sup$m, sup$n, target_slope)
    )
  )
  sol$width_ub <- sol$width
  sol$length_ub <- sol$length
  sol$area_ub <- sol$area
  sol$width <- sol$width_ub * unit_width_m
  sol$length <- sol$length_ub * unit_length_m
  sol$area <- sol$width * sol$length
  sol$area_m2 <- sol$area
  list(
    descriptives = describe_trial(M),
    dimensions = validate_trial_matrix(M),
    long_data = as_long_trial_data(M), smith = smith,
    surface = sup, configurations = cfg, solution = sol,
    basic_unit_dimensions_m = c(width = unit_width_m, length = unit_length_m)
  )
}
