
<!-- README.md is generated from README.Rmd. Please edit that file -->

# clinicalstat

<!-- badges: start -->
<!-- badges: end -->

The goal of clinicalstat is to summarize functional functions in the
process of statistical analysis of clinical data.

## Installation

You can install the development version of clinicalstat from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("cglaze11/clinicalstat")
```

## Example

This is a basic example which shows you how to solve a common problem :

``` r
library(clinicalstat)
```

### 批量替换空值为NA

``` r
head(zap_empty2(ae,AETERM),10)[1:4]
#>    USUBJID TRTP                 AETERM          SOC
#> 1  001S002    1             血尿酸升高     各类检查
#> 2  001S003    2                   <NA>             
#> 3  001S005    2             血尿酸升高     各类检查
#> 4  001S007    2       血白细胞计数降低     各类检查
#> 5  001S007    2 血中性粒细胞绝对值降低     各类检查
#> 6  001S007    2 血中性粒细胞绝对值降低     各类检查
#> 7  001S007    2                   腹痛 胃肠系统疾病
#> 8  001S008    1                   <NA>             
#> 9  001S018    1                   <NA>             
#> 10 001S021    2                   <NA>
```
