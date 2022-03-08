
#' @title ## DEPTH2: An mRNA-based algorithm to evaluate intratumor heterogeneity (ITH) without reference to normal controls
#'
#' @description
#' \code{DEPTH2} DEPTH2 evaluates the ITH level of each bulk tumor sample based on gene expression profiles.
#'
#' @details
#' This function calculates the ITH score of a bulk tumor based on the standard deviations of absolute z-scored expression values of a set of genes in the tumor.
#'
#' @param input_data A dataframe or matrix containing gene expression profiles in tumors, in which the row name is gene symbol or Entrez ID and the column name is tumor sample ID.
#' @export
#' @return A dataframe with 2 columns:
#' \item{Sample}{Tumor samples to be calculated.}
#' \item{DEPTH2_score}{The DEPTH2 score of each sample.}
#' @author Dandan Song <dandan.song@@stu.cpu.edu.cn> and Xiaosheng Wang <xiaosheng.wang@@cpu.edu.cn>
#' @example
#' path <- system.file("extdata", "example_DEPTH2.txt", package = "DEPTH2", mustWork = TRUE)
#' input_data <- read.table(path, stringsAsFactors = FALSE, header = TRUE, check.names = FALSE, sep = "\t", quote = "", row.names = 1)
#' DEPTH2(input_data)


DEPTH2 <- function (input_data) {

	# Check arguments ------------------------------------------------------------
	if (missing(input_data) || !class(input_data) %in% c("matrix", "data.frame"))
		stop("'input_data' is missing or incorrect")

	# DEPTH2 ------------------------------------------------------------
	input_data_adjust <- t(abs(scale(t(input_data))))
	input_data_adjust[which(input_data_adjust == "NaN")] = 0 
	DEPTH20 <- apply(input_data_adjust, 2, sd)
	DEPTH2 <- data.frame(Sample = names(DEPTH20), DEPTH2_score = DEPTH20, row.names = NULL)
	return(DEPTH2)
}


