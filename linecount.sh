#!/usr/bin/env bash

# Clones a git repository and runs line count analysis for each state of the repository.

repository=$1
temporary_repo='tmp.git'

git clone $1 $temporary_repo


cd $temporary_repo
git log --format="%H,%ci" > ../out/commits.csv
for commit in `git log --format="%H"`; do
  git reset --hard $commit &&\
  ../cloc-1.55.pl \
    --read-lang-def=../cloc.out \
    --csv \
    --out=../out/$commit.csv \
    *
done
cd -
rm -rf $temporary_repo
