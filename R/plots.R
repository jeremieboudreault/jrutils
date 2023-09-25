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
        data    = data.frame(x = x),
        mapping = aes(x = x, fill = fill)
    ) +
    geom_histogram(
        mapping  = aes(y = after_stat(density)),
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
        data    = data.frame(x = x, y = y),
        mapping = aes(x = x, y = y, col = col)
    ) +
    geom_point() +
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

plot_pal <- function(pal, rotate_x_labs = FALSE, alpha = 1) {

    if (is.list(pal)) pal <- unlist(pal)
    nms <- if (is.null(names(pal))) seq_along(pal) else names(pal)

    ggplot(
        data = data.frame(x = rjutils::to_factor(nms), y = rep(1, length(pal))),
        mapping = ggplot2::aes(x = x, y = y, fill = x)
    ) +
    geom_col(show.legend = FALSE, alpha = alpha) +
    scale_fill_manual(values = pal) +
    labs(x = NULL, y = NULL, fill = NULL) +
    rjutils::jtheme(rotate_x_labs = rotate_x_labs, borders = "normal", expand = "x_only")

}

