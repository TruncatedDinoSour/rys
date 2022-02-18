#!/usr/bin/env bash

set -e

main() {
    rm -rf built_tests
    mkdir -p built_tests

    cd built_tests

    for rys_test in ../tests/*; do
        time ../src/rysc "$rys_test"

        {
            echo "TEST $rys_test"
            time ./"$(basename "$rys_test" | cut -d '.' -f 1)" || true
        } 2>&1 | tee -a output.log
    done
}

main "$@"