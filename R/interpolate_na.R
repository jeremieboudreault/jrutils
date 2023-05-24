# interpolate_na.R

#' Function to interportale missing values a given time series.
#'
#' @param values : The values for the interpolation.
#' @param dates : The corresponding dates of the values.
#' @param window : The sliding window before and after. Default to `1L`.
#' @param na.rm : Should the NA be removed prior to interpolate. Default to `FALSE`. Unexpected behavior for `TRUE`.
#' @param verbose : Should message be displayed during the process.

#' @return A vector of values with interpolated values.

#' @export
interpolate_na <- function(values, dates, window = 1L, na.rm = FALSE, verbose = FALSE) {

    # First, we will look that data are ordered (by dates) and complete.
    date_rng <- range(dates)
    date_seq <- seq(as.Date(date_rng[1L]), as.Date(date_rng[2L]), by = 1L)

    # Initial check on the number of rows.
    if (length(values) != length(date_seq)) {
        stop("Unique 'dates' provided does not match unique 'values'.")
    }

    # Check that data is ordered.
    if (!all(dates == date_seq)) {
        stop("'dates' are not ordered.")
    }

    # Extract NAs.
    rows <- which(is.na(values))
    nrows_0 <- length(rows)

    # Copy a not interpolated of the dataset.
    x_orig <- values

    # Fix all rows.
    for (row in rows) {

        # Compute index of values used for interpolating.
        is_bef <- seq.int(row - window, row - 1L)
        is_aft <- seq.int(row + 1L, row + window)

        # Fixed values before the start of the values.
        is_bef <- is_bef[is_bef >= 1L]
        is_aft <- is_aft[is_aft <= nrow(x)]

        # Get values after and before.
        val_bef <- x_orig[is_bef]
        val_aft <- x_orig[is_aft]

        # Remove NAs in values for the interpolation.
        val <- if (na.rm)  {
            mean(c(rmna(val_bef), rmna(val_aft)), na.rm = FALSE)
        } else {
            mean(c(val_bef, val_aft), na.rm = FALSE)
        }

        # Update values.
        values[row] <- val

    }

    # Count number of rows fixed.
    nrows_1 <- sum(is.na(values))

    # Message.
    if (verbose) {
        message(nrows_0 - nrows_1, "/", nrows_0, " value(s) interpolated ",
                "(window=", window, ").")
    }

    # Return values.
    return(values)

}
