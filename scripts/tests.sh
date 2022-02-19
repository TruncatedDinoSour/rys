#!/usr/bin/env bash

[ ! "$NOFAIL" ] && set -e

main() {
    rm -rf built_tests
    mkdir -p built_tests

    cd built_tests

    for rys_test in ../"${TESTDIR:-tests}"/*; do
        {
            echo "TEST $rys_test"
            time ../src/rysc "$rys_test" -linux-elf64-x86_64-nasm "$@"
            time ./"$(basename "$rys_test" | cut -d '.' -f 1)" || true
            echo
        } 2>&1 | tee -a build.log
    done
}

main "$@"
