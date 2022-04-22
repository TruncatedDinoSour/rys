#!/usr/bin/env bash

[ ! "$NOFAIL" ] && set -e

main() {
    rm -rf built_tests
    mkdir -p built_tests built_tests/include

    cd built_tests

    echo 'GENERATE include/hello_world.rys'
    # shellcheck disable=SC2028
    echo '"hello world\n" 1 writefd clear' >include/hello_world.rys

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
