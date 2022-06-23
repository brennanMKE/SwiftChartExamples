#!/bin/sh

UPSTREAM_READY=$(git remote show upstream | grep "* remote upstream" | wc -l | bc)

if [ $UPSTREAM_READY == 0 ]; then
    git remote add upstream https://github.com/jordibruin/SwiftChartExamples.git
fi

git fetch upstream
git pull upstream main
git checkout main
git reset --hard upstream/main
git push origin main -f
