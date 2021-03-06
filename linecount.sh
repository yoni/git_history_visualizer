#!/usr/bin/env bash

# Clones a git repository and runs line count analysis for each state of the repository.

repository=$1
out=$2
temporary_repo='tmp.git'

git clone $1 $temporary_repo


cd $temporary_repo
number_of_commits=`git rev-list HEAD --count`
echo "Number of commits: $number_of_commits"
git log --format="%H,%ci" > $out/commits.csv
for commit in `git log --format="%H"`; do
  git reset --hard $commit &&\
  cloc \
    --exclude-dir=.git \
    --csv \
    --out="$out/$commit.csv" \
    *
done
cd -
rm -rf $temporary_repo
