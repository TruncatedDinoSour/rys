#!/usr/bin/env bash

[ ! "$NOFAIL" ] && set -e

main() {
    rm -rf built_tests
    mkdir -p built_tests

    cd built_tests

    for rys_test in ../"${TESTDIR:-tests}"/*; do
        time ../src/rysc "$rys_test" -linux-elf64-x86_64-nasm "$@" 2>&1 | tee -a build.log

        {
            echo "TEST $rys_test"
            time ./"$(basename "$rys_test" | cut -d '.' -f 1)" || true
        } 2>&1 | tee -a output.log
    done
}

main "$@"
