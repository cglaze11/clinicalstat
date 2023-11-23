#' Summary of adverse events
#'
#' @description
#' `zap_empty2()` allows you to Summary of adverse events
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
#'

codelist <- c("SOC","PT")

tfl_coding <- function(.data,...,group,subject,order=FALSE){
  dots <- enquos(...)
  n_dots <- length(dots)

  cols_select <- map_chr(dots, function(dot) {
    if (length(dots)){
      expr <- quo_get_expr(dot)
      if (as.character(expr) %in% names(.data)) {
        as.character(expr)
      }
      else{
        abort(paste("Variable:",expr,"doesn't exist in the dataframe."))
      }
    }
  })

  # print(paste0(cols_select, collapse = ", "))
  # print(.data)
  arrange(.data,paste0(cols_select, collapse = ", "))
  for (i in c(1:n_dots)){
    order_cols <- paste0(cols_select[1:i], collapse = ", ")
    distinct_cols <- paste0(c(subject,order_cols),collapse = ", ")
    print(distinct_cols)
    .subdata <- .data %>% arrange(dots)
    # %>% distinct(subject,.keep_all = TRUE) %>%
    #   summarise(
    #     n=n()
    #   )
    # print(.subdata[subject])
  }
}

tfl_coding(data,SOC,PT,subject="USUBJID")
arrange(data,desc(USUBJID))
cnt1 <- .data %>% group_by(TRTP,SOC)
groups(cnt1)
cnt2 <- .data %>% distinct(USUBJID,SOC,PT,.keep_all = TRUE) %>%
  group_by(TRTP,SOC,PT) %>% summarise(
    n2=n()
  )

socpt <- right_join(cnt1,cnt2,by=c("TRTP","SOC"))

socptnest <- socpt %>% arrange(desc(n1),desc(n2)) %>% nest(data=c(PT,n2))

socnesttran <- pivot_wider(socptnest,names_from = TRTP,values_from = "data")
socptnest[["SOC"]][1]
socptnest[["data"]][1]
