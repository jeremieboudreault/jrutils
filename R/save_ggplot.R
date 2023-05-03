# save_ggplot.R

#' A custom function to save ggplot into predefined sizes.
#'
#' `save_ggplot` is a wrapper for [ggplot2::ggsave()] that allows the user
#' to save plots in predefined sizes.
#'
#' This function is very convinient for scientific articles or presentations
#' when you need all your figures to have the same aspect ratio.
#'
#' @param file : Filename to save the plot.
#' @param size : One of the predefined sizes given in 'sizes_map' or a vector of size 2.
#' @param ... : Other arguments passed to [ggplot2::ggsave()].
#'
#' @include globals.R
#'
#' @export
save_ggplot <- function(file, size = "rect", ...) {

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

    # Save plot.
    ggplot2::ggsave(
        filename = file,
        width    = sizewh[1L],
        height   = sizewh[2L],
        ...      = ...
    )
}

