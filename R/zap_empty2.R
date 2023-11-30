#' replace empty strings with NA
#'
#' @description
#' `zap_empty2()` allows you to replace empty strings in all columns or specific columns
#' of a data frame with NA.
#'
#' @param .data A data frame.
#' @param ...  specific columns names of `.data`,If ignored, select all columns.
#' @return A data frame
#' @import rlang
#' @export
#' @examples
#'
#' t <- zap_empty2(ae,AETERM)
#'
#' t <- zap_empty2(ae,AETERM,AEREL)
#'
#' t <- zap_empty2(ae)

zap_empty2 <- function(.data,...){

    stopifnot(is.data.frame(.data))

    dots <- enquos(...)
    n_dots <- length(dots)

    chrcols <- list()
    if (n_dots) {
      for (i in c(1:n_dots)){
        expr <- quo_get_expr(dots[[i]])
          if (as.character(expr) %in% names(.data)) {
            chrcols[i] <- as.character(expr)
          }
          else{
            abort(paste("Variable:",expr,"doesn't exist in the dataframe."))
          }
      }
    }
    else {
      chrcols <- names(.data)
    }

    for (chrcol in chrcols){
      if (is.character(.data[[chrcol]])) {
        .data[[chrcol]][.data[[chrcol]] == ""] <- NA
      }
    }
    return(.data)
}

# load("data/ae.rda")
# t <- zap_empty2(ae,AETERM,AEREL)
# t <- zap_empty2(ae,AETERM)
# t <- zap_empty2(ae)
