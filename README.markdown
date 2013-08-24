A utility for calculating and visualizing lines of code in a git repository throughout it's history.

Includes the following stats for each commit, by language (i.e. file extension):
* Number of files
* Comment lines
* Blank lines
* Code lines

Prerequisites
-------------

Perl -- the main lines-of-code counting logic is in the [cloc](http://cloc.sourceforge.net/) Perl script, which is
called by `linecount.sh` for each individual git commit.

Ruby -- used to retrieve the set of Git repositories from a Github instance (e.g. github.com or Github Enterprise).

R -- used for stats visualizations over time. Requires the `rbundler` R package for dependency management.

Usage
-----

There are several executables for running different high-level or lower-level tasks:

Run stats calculations _and_ image generation for a given git repository:

   run.sh GIT_REPOSITORY OUT_PATH

        GIT_REPOSITORY may be any git path or URL
        OUT_PATH is the path to which output (e.g. images, CSV) will be placed.

Run stats calculations or plot generation _independently_:

    linecount.sh GIT_REPOSITORY OUT_PATH

        GIT_REPOSITORY may be any git path or URL
        OUT_PATH is the path to which output (e.g. images, CSV) will be placed.

    run_linevis.R OUT_PATH

        OUT_PATH is the path to which output (e.g. images, CSV) will be placed.


Get a JSON representation of a given Github user's repositories:

    github_repositories.rb HOST USER

        HOST the Github host from which to retrieve user repositories (e.g. www.github.com).
        USER the Github user for which to retrieve repositories (e.g. your-username).


Run stats calculations _and_ image generation for a set of git repositories based on the output
of `github_repositories.rb`:

    run_linevis_for_repositories.rb REPOSITORIES_FILE PATTERN OUT_PATH

        REPOSITORIES_FILE the output of `github_repositories.rb` in JSON format
        PATTERN a Ruby regular expression used to match repositories from REPOSITORIES_FILE (e.g. '^stuff$')
        OUT_PATH is the path to which output (e.g. images, CSV) will be placed.

