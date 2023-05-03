# save_plot.R

#' A custom function to save classic plot into predefined sizes.
#'
#' `save_plot` is a wrapper for [png()] ... [dev.off()] that allows the user
#' to save plots in predefined sizes.
#'
#' This function is very convinient for scientific articles or presentations
#' when you need all your figures to have the same aspect ratio.
#'
#' @param file : Filename to save the plot.
#' @param size : One of the predefined sizes given in 'sizes_map'.
#' @param pl_expr : The plot expression to be saved.
#' @param res : A custom resolution. Default to `300`
#'
#' @include globals.R
#'
#' @export
save_plot <- function(file, size = "rect", pl_expr, res = 300L, w = NULL, h = NULL) {

    # Extract size from the mapping.
    if (length(size) == 1L) {

        # Extract size.
        sizewh <- sizes_map[[size]]

        # Check if it is null.
        if (is.null(sizewh)) {
            warning("'size' invalid. Using default value 'rect'.")
            sizewh <- sizes_map[["rect"]]
        }

    # Use custom size from a vector.
    } else if (length(size) == 2L &
            class(size[1L]) %in% c("numeric", "integer") &
            class(size[2L]) %in% c("numeric", "integer")) {

        # Use custom size.
        sizewh <- size

    } else {

        # Throw error.
        stop("Invalid size provided.\n> Should be a name or a vector of size 2.")

    }

    # Convert to the correct size.
    sizewh <- sizewh * res * 1.1

    # Use png format.
    png(filename = file, width = sizewh[1L], height = sizewh[2L], res = res)

    # Set some plot chracteristics.
    par(family = "Source Sans Pro")

    # Print plot.
    eval(pl_expr)

    # Save plot.
    dev.off()

}
