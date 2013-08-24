#!/usr/bin/env Rscript
options(repos='http://cran.rstudio.com')
library(rbundler)
bundle()
library(githistoryvisualizer)

args <- commandArgs(trailingOnly = TRUE)
if(length(args) != 1)
  stop("Usage: linevis.R PATH")

path <- args[1]
commit_stats <- load_commit_stats(path)
plot_all_to_PNG(commit_stats, path)
message("Plotted commit stats to [", path, "]")
