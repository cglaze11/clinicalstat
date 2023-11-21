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
#' @importFrom purrr map
#' @export
#' @keywords internal
#' @examples
#'
#' t <- zap_empty2(ae,AETERM)
#'
#' t <- zap_empty2(ae,AETERM,AEREL)
#'
#' t <- zap_empty2(ae)

zap_empty2 <- function(.data,...){

  if (is.data.frame(.data)) {
    dots <- enquos(...)

    cols_select <- map(dots, function(dot) {
      if (length(dots)){
        expr <- quo_get_expr(dot)
        if (as.character(expr) %in% names(.data)) {
          expr
        }
        else{
          abort(paste("Variable:",expr,"doesn't exist in the dataframe."))
        }
      }
    })

    if (length(cols_select)) {
      chrcols <- as.character(cols_select)
    }
    else {
      chrcols <- names(.data)
    }

    for (chrcol in chrcols){
      # .data[[chrcol]] <- na_if(.data[[chrcol]],"")

      if (is.character(.data[[chrcol]])) {
        .data[[chrcol]][.data[[chrcol]] == ""] <- NA
      }
    }
    return(.data)
  }
}

# load("data/ae.rda")
# t <- zap_empty2(ae,AETERM.AEREL)
