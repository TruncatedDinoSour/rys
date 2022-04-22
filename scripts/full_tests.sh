#!/usr/bin/env sh

main() {
    if ! ./scripts/tests.sh "$@"; then
        echo '!! TESTS DID NOT PASS'
        exit 1
    fi

    printf '****** Press enter to start failing tests testing ******'
    read -r

    export NOFAIL=1 TESTDIR=tests_fail

    if ! ./scripts/tests.sh "$@"; then
        echo '!! TESTS DID NOT PASS'
        exit 1
    fi

    printf '****** Press enter to start example testing ******'
    read -r

    export TESTDIR=examples

    if ! ./scripts/tests.sh "$@"; then
        echo '!! TESTS DID NOT PASS'
        exit 1
    fi
}

main "$@"
