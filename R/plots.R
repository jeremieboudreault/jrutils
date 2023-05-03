# plots.R

#' Functions for diverse types of plots.
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


#' @export
plot_void <- ggplot2::ggplot() + ggplot2::theme_void()

#' Plot random
#'
#' @export
plot_random <- function(id = 1) {

    if (id == 1) {
        return(
            ggplot(data = MASS::Cars93, aes(x = Price, y = MPG.city, col = DriveTrain)) +
                geom_point()
        )
    }
    if (id == 2) {
        return(
            ggplot(data = MASS::Cars93, aes(x = Fuel.tank.capacity, y = Rear.seat.room, col = DriveTrain)) +
                geom_point()
        )
    }

}

#' A function to plot a palette of color.
#'
#' `plot_pal` takes a palette of colors of values and plot it.
#'
#' @param pal : A vector of colors.
#'
#' @export

plot_pal <- function(pal) {

    plot(
        x   = seq_along(pal),
        y   = rep(1, length(pal)),
        col = pal,
        pch = 19,
        cex = 5
    )

}



