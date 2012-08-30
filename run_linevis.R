#!/usr/bin/env Rscript
library(ggplot2)
library(plyr)

source('linevis.R')

args <- commandArgs(trailingOnly = TRUE)
if(length(args) != 1)
  stop("Usage: linevis.R PATH")

path <- args[1]
commit_stats <- load_commit_stats(path)
plot_all_to_PNG(commit_stats, path)
message("Plotted commit stats to [", path, "]")
