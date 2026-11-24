test_that("analyze_uniformity_trial returns a plotsizing_analysis list", {
  r <- analyze_uniformity_trial(example_trial("rice"), criterion = "all", target_slope = 0.5)
  expect_s3_class(r, "plotsizing_analysis")
  expect_true(is.list(r))
  expect_equal(r$trial, example_trial("rice"))
  expect_equal(r$settings$criterion, "all")
  expect_equal(r$settings$target_slope, 0.5)
})

test_that("print shows the fitted surface and the solutions", {
  r <- analyze_uniformity_trial(example_trial("rice"), criterion = "all")
  out <- capture.output(res <- print(r))
  expect_identical(res, r)
  expect_true(any(grepl("20 rows x 20 columns = 400 basic units", out, fixed = TRUE)))
  expect_true(any(grepl("Smith (1938) b': 0.827", out, fixed = TRUE)))
  expect_true(any(grepl("CV = 22.95 * x^-0.608 * y^-0.232", out, fixed = TRUE)))
  expect_true(any(grepl("gaussian", out)) && any(grepl("marginal", out)))
})

test_that("summary reports parameter estimates without p-values", {
  r <- analyze_uniformity_trial(example_trial("rice"), criterion = "all")
  s <- summary(r)
  expect_s3_class(s, "summary.plotsizing_analysis")
  expect_equal(colnames(s$surface), c("Estimate", "Std. Error"))
  expect_equal(unname(s$surface[, "Estimate"]), c(r$surface$a, r$surface$m, r$surface$n))
  expect_equal(s$solution$area, r$solution$area)
  expect_equal(s$smith$b_prime, r$smith$b_prime)
  out <- capture.output(print(s))
  expect_true(any(grepl("Marginal target slope: 1", out, fixed = TRUE)))
  expect_false(any(grepl("Pr(>|t|)", out, fixed = TRUE)))
})

test_that("plot dispatches to each figure with the stored settings", {
  r <- analyze_uniformity_trial(example_trial("rice"), criterion = "all", target_slope = 2)
  for (w in c("contours", "sections", "profiles", "heatmap")) {
    expect_s3_class(plot(r, which = w), "ggplot")
  }
  p <- plot(r)
  marginal <- marginal_efficiency_2d(r$surface$a, r$surface$m, r$surface$n, target_slope = 2)
  pts <- ggplot2::layer_data(p, 3L)
  expect_true(any(abs(pts$x - marginal$width) < 1e-8))
  grDevices::pdf(NULL)
  on.exit(grDevices::dev.off(), add = TRUE)
  expect_invisible(plot(r, which = "surface"))
  expect_error(plot(r, which = "nope"))
})

test_that("plot sections uses the sectional point when criterion is both", {
  r <- analyze_uniformity_trial(example_trial("cowpea"))
  expect_s3_class(plot(r, which = "sections"), "ggplot")
})
