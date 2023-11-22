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
#
# ae <- read_sas("D:/01/R/AL01211-R/Data/RAW/ae.sas7bdat") %>%
#   select(!starts_with("__")) %>% mutate(
#     TRTP=ifelse(as.numeric(str_sub(USUBJID,5,7))%%2==0,"1","2")
#   ) %>% relocate(
#     TRTP,.after = 1
#   ) %>%
#   rename(
#     SOC=AETERM_SOC,
#     HLGT=AETERM_HLGT,
#     HLT=AETERM_HLT,
#     PT=AETERM_PT
#   ) %>%
#   select(
#     USUBJID,TRTP,AETERM,SOC,HLGT,HLT,PT,AESEV,AEREL,AEACN
#   )
# save(ae,file = "D:/01/R/clinicalstat/data/ae.rda")
# t <- zap_empty2(ae,AETERM.AEREL)
