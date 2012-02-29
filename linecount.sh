#!/usr/bin/env bash

# Clones a git repository and runs line count analysis for each state of the repository.

repository=$1
out=$2
temporary_repo='tmp.git'

git clone $1 $temporary_repo
cd $temporary_repo

for commit in `git log --format='%H'`; do
  git reset --hard $commit &&\
  R CMD build . &&\
  ../cloc-1.55.pl \
    --read-lang-def=../cloc.out \
    --extract-with="tar zxf >FILE<" \
    --csv \
    *.tar.gz > $out/$commit.out &&\
  rm *.tar.gz
done
cd -
rm -rf $temporary_repo
