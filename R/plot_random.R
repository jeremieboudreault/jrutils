# plot_random()

#' A function to draw a random plot to test function.
#'
#' `plot_random` takes a palette of colors of values and plot it.
#'
#' @export
plot_random <- function(id) {

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
