# DEPTH2
An mRNA-based algorithm to evaluate intratumor heterogeneity (ITH) without reference to normal controls.

## Description

DEPTH2 evaluates the ITH level of each bulk tumor sample based on gene expression profiles.

## Details

DEPTH2 calculates a tumor’s ITH level based on the standard deviations of absolute z-scored expression values of a set of genes in the tumor. In a tumor, if most genes show close absolute z-scored expression values, the tumor will likely have a low DEPTH2 score, namely low ITH level; otherwise, the tumor will have a relatively high ITH level. 
 **Input data** are gene expression profiles in bulk tumor samples (microarray or RNA-Seq data, normalized), and **output data** are DEPTH2 ITH scores for each bulk tumor.
The following tables illustrate an example of input data (Table 1) and an example of output data (Table 2).

   **Table 1. Gene expression matrix**

| Entrez ID | sample1 | sample2 | sample3 | sample4 | sample5 |
| :-------: | :-----: | :-----: | :-----: | :-----: | :-----: |
|   57505   |  8.23   |  8.68   |  8.19   |  9.06   |  8.70   |
|   80755   |  9.82   |  8.50   |  8.82   |  8.78   |  9.73   |
|    16     |  11.78  |  12.42  |  11.98  |  11.42  |  11.55  |
|   60496   |  10.52  |  9.68   |  10.03  |  9.21   |  9.99   |
|  132949   |  6.68   |  7.97   |  7.69   |  8.52   |  8.09   |
|   10157   |  9.89   |  7.53   |  8.25   |  9.33   |  7.57   |
|   26574   |  10.30  |  10.05  |  9.81   |  9.09   |  10.14  |
|   9625    |  4.85   |  10.08  |  6.55   |  8.82   |  5.50   |
|    18     |  10.63  |  10.53  |  9.88   |  9.29   |  9.19   |
|   10349   |  6.16   |  3.41   |  5.24   |  4.96   |  4.20   |

   **Table 2. DEPTH2 scores of tumors**
                                             

| Sample  | DEPTH2_score |
| :-----: | :----------: |
| sample1 |     0.40     |
| sample2 |     0.47     |
| sample3 |     0.28     |
| sample4 |     0.44     |
| sample5 |     0.28     |



## Installation

A user can install the released version of DEPTH2 with:

```
if (!requireNamespace("devtools", quietly = TRUE))
    install.packages("devtools")
devtools::install_github("XS-Wang-Lab/DEPTH2/DEPTH2")
```

## Example

```
## Calculate ITH based on the gene expression profiles in tumors
library(DEPTH2)
path <- system.file("extdata", "example_DEPTH2.txt", package = "DEPTH2", mustWork = TRUE)
input_data <- read.table(path, stringsAsFactors = FALSE, header = TRUE, check.names = FALSE, sep = "\t", quote = "", row.names = 1)
DEPTH2(input_data)
```

## Contact

E-mail any questions to Dandan Song (dandan.song@stu.cpu.edu.cn) and Xiaosheng Wang (xiaosheng.wang@cpu.edu.cn)
