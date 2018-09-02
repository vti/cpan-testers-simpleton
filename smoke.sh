#!/bin/bash

while true; do
    MODULE=$(./wait-for-recent --verbose)

    mkdir -f .cpanm

    docker run --rm -ti \
        -v $PWD/.cpanreporter:/root/.cpanreporter \
        -v $PWD/.cpanm:/root/.cpanm \
        cpan-testers bash -c "cd; bin/cpanm $MODULE"

    rm .cpanm/build.log && ln -s $(ls -td $PWD/.cpanm/work/*/build.log | head -n 1) .cpanm/build.log

    cpanm-reporter --ignore-versions --build_dir .cpanm
done
