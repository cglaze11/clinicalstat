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
#' @import purrr
#' @import dplyr
#' @export
#' @keywords internal
#' @examples
#' load("data/ae.rda")
#'
#' zap_empty2(ae,AETERM)
#'
#' zap_empty2(ae,AETERM,AEREL)
#'
#' zap_empty2(ae,AETERM.AEREL)
#'
#' zap_empty2(ae)

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
      chrcols <- names(select_if(.data,is.character))
    }

    for (chrcol in chrcols){
      .data[[chrcol]] <- na_if(.data[[chrcol]],"")
    }
    return(.data)
  }
}

 # load("data/ae.rda")
 #
 # zap_empty2(ae,AETERM)
 #
 # zap_empty2(ae,AETERM,AEREL)
 #
 # zap_empty2(ae,AETERM.AEREL)
 #
 # zap_empty2(ae)
