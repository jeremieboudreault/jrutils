# plot_hist()

#' A function to quickly plot a histogram of data.
#'
#' `plot_hist` takes a palette of colors of values and plot it.
#'
#' @param x : The vector of data to be plotted.
#' @param ... : Other arguments passed to `jtheme()`.
#'
#' @export

plot_hist <- function(x, main = NULL, fill = NULL, bins = 16, ...) {

    ggplot(
        data = data.frame(x = x),
    ) +
    geom_histogram(
        mapping  = aes(x = x, y = ..density.., fill = fill),
        position = "dodge",
        bins     = bins
    ) +
    ggtitle(label = main) +
    jtheme(expand = "x_only", borders = "normal", ...)

}

# Examples.
# plot_hist(runif(100), main = "Hello world")
# plot_hist(c(runif(100), rnorm(100)), fill = rep(c("unif", "norm"), each = 100L))
