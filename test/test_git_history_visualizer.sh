#!/bin/sh
mkdir -p out
./linecount.sh . ./out && ./run_linevis.R ./out
