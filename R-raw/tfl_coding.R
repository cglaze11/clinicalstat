#' Summary of adverse events
#'
#' @description
#' `zap_empty2()` allows you to Summary of adverse events
#'
#' @param .data A data frame.
#' @param ...  Variables, or functions of variables.
#' @param group a vector of group Variables
#' @return A data frame
#' @import rlang
#' @importFrom purrr map
#' @importFrom dplyr
#' @export
#' @examples
#'
#' t <- zap_empty2(ae,AETERM)
#'
#' t <- zap_empty2(ae,AETERM,AEREL)
#'
#' t <- zap_empty2(ae)
#'

tfl_coding <- function(.data,...,group,subject,order=FALSE) {
  UseMethod("tfl_coding")
}

#' @rdname tfl_coding
#' @export

tfl_coding.data.frame <- function(.data,...,group,subject,order=FALSE,.locale = NULL){

  stopifnot(is.data.frame(.data))

  dots <- enquos(...)
  n_dots <- length(dots)

  dots_grp <- list()
  for (i in seq(length(group))){
    grp <- as.name(group[i])
    dots_grp <- c(dots_grp,new_quosure({{grp}},env = globalenv()))
  }
  dots <- c(dots_grp ,dots)


  tfl.distinct.sum.tran(.data,...,group=group,subject=subject,order=order)

}


# distinct, summary, transpose by level

tfl.distinct.sum.tran <- function(.data,...,group,subject,order=FALSE){
  # print({{dots}})
  # var <- quo_get_expr(dots[[1]])
  # var1 <- as.name("PT")
  # var2 <- as.name("SOC")
  #
  # print(class({{var1}}))
  # print(c(var1,var2))
  dis <-  dplyr::distinct(.data,...,keep_all=TRUE)
  # dis <- .data[c(group,subject)]
  print()
  # duplicated(dis)
}

tfl_coding(ae,SOC,PT,group=c("TRTP","SOC"),subject="USUBJID")

# dots <- c(quos(!!!groups(.data)), dots)

group <- c("TRTP","AEREL")
as.name(group)
