#' Print a uniformity-trial analysis
#'
#' Shows the trial size, the Smith index, the fitted CV surface and the
#' continuous solution of each criterion.
#' @param x An object returned by [analyze_uniformity_trial()].
#' @param digits Number of significant digits to print.
#' @param ... Ignored.
#' @return `x`, invisibly.
#' @examples
#' result <- analyze_uniformity_trial(example_trial("rice"))
#' print(result)
#' @export
print.plotsizing_analysis <- function(x, digits = 3, ...) {
  d <- x$dimensions
  bu <- x$basic_unit_dimensions_m
  s <- x$surface
  cat("Uniformity-trial analysis (plotsizing)\n\n")
  cat(sprintf(
    "Trial: %d rows x %d columns = %d basic units of %s x %s m\n",
    d$rows, d$columns, d$n_ub, format(bu[["width"]]), format(bu[["length"]])
  ))
  cat(sprintf(
    "Configurations: %d (at least %d plots each)\n",
    nrow(x$configurations), as.integer(x$settings$min_plots)
  ))
  cat(sprintf("Smith (1938) b': %s\n", format(x$smith$b_prime, digits = digits)))
  cat(sprintf(
    "CV surface: CV = %s * x^-%s * y^-%s  (x = width, y = length, in basic units)\n\n",
    format(s$a, digits = digits + 1), format(s$m, digits = digits),
    format(s$n, digits = digits)
  ))
  cat("Solutions (width, length in m; area in m2; CV in %):\n")
  print(.solution_table(x$solution), digits = digits, row.names = FALSE)
  invisible(x)
}

#' Summarize a uniformity-trial analysis
#'
#' Collects the descriptive statistics of the basic units, the Smith
#' estimate, the fitted CV-surface parameters with their standard errors and
#' the solutions of each criterion. The standard errors come from the
#' nonlinear least-squares fit and are approximate: the configurations are
#' built from the same basic units, so their CVs are not independent.
#' p-values are therefore not reported.
#' @param object An object returned by [analyze_uniformity_trial()].
#' @param ... Ignored.
#' @return An object of class `summary.plotsizing_analysis`, a list with
#'   `descriptives`, `smith`, `surface` (parameter table), `rmse`,
#'   `solution` and `settings`.
#' @examples
#' result <- analyze_uniformity_trial(example_trial("rice"), criterion = "all")
#' summary(result)
#' @export
summary.plotsizing_analysis <- function(object, ...) {
  coefs <- summary(object$surface$model)$coefficients[, 1:2, drop = FALSE]
  structure(
    list(
      descriptives = object$descriptives,
      smith = data.frame(
        method = object$smith$method,
        b_prime = object$smith$b_prime,
        n_configurations = object$smith$n_configurations
      ),
      surface = coefs,
      rmse = object$surface$rmse_descriptive,
      solution = .solution_table(object$solution),
      settings = object$settings
    ),
    class = "summary.plotsizing_analysis"
  )
}

#' @rdname summary.plotsizing_analysis
#' @param x An object of class `summary.plotsizing_analysis`.
#' @param digits Number of significant digits to print.
#' @export
print.summary.plotsizing_analysis <- function(x, digits = 3, ...) {
  cat("Basic-unit yields:\n")
  print(x$descriptives, digits = max(digits, 4L), row.names = FALSE)
  cat("\nSmith (1938) variance law:\n")
  print(x$smith, digits = digits, row.names = FALSE)
  cat("\nCV surface CV = a * x^-m * y^-n (nonlinear least squares):\n")
  print(x$surface, digits = digits)
  cat("Standard errors are approximate: configurations share basic units.\n")
  cat(sprintf("Descriptive RMSE: %s CV points\n", format(x$rmse, digits = digits)))
  cat("\nSolutions (width, length in m; area in m2; CV in %):\n")
  print(x$solution, digits = digits, row.names = FALSE)
  if (x$settings$criterion %in% c("marginal", "all")) {
    cat(sprintf(
      "Marginal target slope: %s CV points per basic unit\n",
      format(x$settings$target_slope)
    ))
  }
  invisible(x)
}

#' Plot a uniformity-trial analysis
#'
#' Draws one of the package figures from an analysis, using the settings
#' stored in it (for example the marginal target slope).
#' @param x An object returned by [analyze_uniformity_trial()].
#' @param which Figure to draw: `"contours"` (default, [plot_cv_contours()]),
#'   `"surface"` ([plot_cv_surface()]), `"sections"`
#'   ([plot_curvature_sections()]), `"profiles"` ([plot_cv_profiles()]) or
#'   `"heatmap"` ([plot_trial_heatmap()]).
#' @param ... Further arguments passed to the plotting function.
#' @return A ggplot object, except for `which = "surface"`, which draws a
#'   base-R plot and returns invisibly.
#' @examples
#' result <- analyze_uniformity_trial(example_trial("rice"), criterion = "all")
#' plot(result)
#' plot(result, which = "sections")
#' @export
plot.plotsizing_analysis <- function(x,
                                     which = c(
                                       "contours", "surface", "sections",
                                       "profiles", "heatmap"
                                     ),
                                     ...) {
  which <- match.arg(which)
  slope <- x$settings$target_slope
  switch(which,
    contours = plot_cv_contours(x$surface, x$configurations, target_slope = slope, ...),
    surface = plot_cv_surface(x$surface, x$configurations, target_slope = slope, ...),
    sections = plot_curvature_sections(x$surface,
      criterion = if (x$settings$criterion == "both") "sectional" else x$settings$criterion,
      configurations = x$configurations, target_slope = slope, ...
    ),
    profiles = plot_cv_profiles(x$configurations, x$surface, ...),
    heatmap = plot_trial_heatmap(x$trial, ...)
  )
}

.solution_table <- function(solution) {
  data.frame(
    criterion = solution$criterion,
    width = solution$width,
    length = solution$length,
    area = solution$area,
    cv = solution$cv
  )
}
