# plot_random()

#' A function to draw a random plot to test function.
#'
#' `plot_random` takes a palette of colors of values and plot it.
#'
#' @export
plot_random <- function() {

    ggplot(data = MASS::Cars93, aes(x = Price, y = MPG.city)) +
    geom_point()

}
