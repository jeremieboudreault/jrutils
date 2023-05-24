# helpers.R

# A combination of small function to perform operations.

#' @export
narm <- function(x) return(x[!is.na(x)])

#' @export
xpaste0 <- function(x, y, sep = "_") {
    as.vector(sapply(x, function(w) paste(w, y, sep = sep)))
}

#' @export
ul <- function(x, recursive = FALSE, use.names = FALSE) {
    unlist(x, recursive, use.names)
}

#' @description
#' `round_trim` is a wrapper for [base::round()] and [base::format()].
#'
#' @param x : The number of the rounded.
#' @param nsmall : The number of digits.
#'
#' @export
round_trim <- function(x, nsmall) {
    format(
        x      = round(x, nsmall),
        nsmall = nsmall
    )
}

#' @export
to_percent <- function(x, nsmall = 1) {
    paste0(round_trim(x * 100, nsmall), "%")
}

#' @description
#' `to_factor` is a wrapper for [base::factor()] that allows to easily convert
#' a string character to some factors for plotting purpose.
#'
#' @param rev : Do you want to reverse the levels.
#'
#' @export
to_factor <- function(x, rev = FALSE) {
    levels <- if (rev) rev(unique(x)) else unique(x)
    return(factor(x, levels))
}
