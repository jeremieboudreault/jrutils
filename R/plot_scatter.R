# plot_scatter()

#' A function to quickly plot a scatter plot of data.
#'
#' `plot_scatter` : A function to quickly plot a scatter plot of data.
#'
#' @param x : The vector of data to be plotted.
#' @param y : The vector of data to be plotted.
#' @param ... : Other arguments passed to `jtheme()`.
#'
#' @export

plot_scatter <- function(x, y, main = NULL, col = NULL, ...) {

    ggplot(
        data = data.frame(x = x, y = y),
    ) +
    geom_point(
        mapping = aes(x = x, y = y, col = col)
    ) +
    ggtitle(label = main) +
    jtheme(...)

}

# Examples
# plot_scatter(runif(100), rnorm(100), "Hello world")
# plot_scatter(runif(100), rnorm(100), col = sample(c("a", "b", "c"), 100L, TRUE))

