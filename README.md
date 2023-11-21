
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

This is a basic example which shows you how to solve a common problem:

``` r
library(clinicalstat)
## basic example code
```

### 批量替换空值为NA

``` r
head(zap_empty2(ae,AETERM),20)[1:4]
#>    USUBJID                 AETERM        AETERM_d       AETERM_SOC
#> 1  001S002             血尿酸升高 MedDRA/C [25.1]         各类检查
#> 2  001S003                   <NA>                                 
#> 3  001S005             血尿酸升高 MedDRA/C [25.1]         各类检查
#> 4  001S007       血白细胞计数降低 MedDRA/C [25.1]         各类检查
#> 5  001S007 血中性粒细胞绝对值降低 MedDRA/C [25.1]         各类检查
#> 6  001S007 血中性粒细胞绝对值降低 MedDRA/C [25.1]         各类检查
#> 7  001S007                   腹痛 MedDRA/C [25.1]     胃肠系统疾病
#> 8  001S008                   <NA>                                 
#> 9  001S018                   <NA>                                 
#> 10 001S021                   <NA>                                 
#> 11 001S034       急性上呼吸道感染 MedDRA/C [25.1] 感染及侵染类疾病
#> 12 001S034               口腔溃疡 MedDRA/C [25.1]     胃肠系统疾病
#> 13 001S036             血尿酸升高 MedDRA/C [25.1]         各类检查
#> 14 001S037               口腔溃疡 MedDRA/C [25.1]     胃肠系统疾病
#> 15 001S049               口腔溃疡 MedDRA/C [25.1]     胃肠系统疾病
#> 16 001S049                   头晕 MedDRA/C [25.1] 各类神经系统疾病
#> 17 001S049                   头痛 MedDRA/C [25.1] 各类神经系统疾病
#> 18 001S049           左上眼皮疼痛 MedDRA/C [25.1]       眼器官疾病
#> 19 001S049                   腹胀 MedDRA/C [25.1]     胃肠系统疾病
#> 20 001S049                   腹痛 MedDRA/C [25.1]     胃肠系统疾病
```
