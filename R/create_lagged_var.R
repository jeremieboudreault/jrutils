# create_lagged_var.R

#' Function to create a lagged var from a given time series.
#'
#' @param values : The values for the lags calculation.
#' @param dates : The corresponding dates of the values.
#' @param lag_0 : Initial lag. Default to `0`
#' @param lag_1 : Last lag. Default to `1`
#' @param fun : Function to aggreagate multiple values. Default to `mean`
#'
#' @export
create_lagged_var <- function(
        values,
        dates,
        lag_0        = 0L,
        lag_1        = 1L,
        fun          = function(w, ...) mean(w, ...),
        ...) {

    # First, we will look that data are ordered (by var_date) and complete.
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

    # Check for NAs in the supplied variable.
    if (sum(is.na(values)) > 0) {
        warning("'values' contains NA. Some lagged variables will have NAs.")
    }

    # Compute fun over the lag period - when is the same lag for lag_0 and lag_1
    if (lag_1 - lag_0 == 0) {
        val <- apply(
            X      = cbind(data.table::shift(values, n = lag_0:lag_1)),
            MARGIN = 1L,
            FUN    = fun,
        )
    # When there are >= 1 lag
    } else {
        val <- apply(
            X      = do.call(cbind, data.table::shift(values, n = lag_0:lag_1)),
            MARGIN = 1L,
            FUN    = fun, ...
        )
    }

    # Return val.
    return(val)

}
