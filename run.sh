#!/bin/sh
git_repo=$1
out=$2
./linecount.sh $git_repo $out && ./run_linevis.R $out
