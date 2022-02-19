#!/usr/bin/env sh

main() {
    if ! ./scripts/tests.sh "$@"; then
        echo '!! TESTS DID NOT PASS'
        exit 1
    fi

    printf '****** Press enter to start failing tests testing ******'
    read -r

    if ! NOFAIL=1 TESTDIR=tests_fail ./scripts/tests.sh "$@"; then
        echo '!! TESTS DID NOT PASS'
        exit 1
    fi

    printf '****** Press enter to start example testing ******'
    read -r

    if ! TESTDIR=examples ./scripts/tests.sh "$@"; then
        echo '!! TESTS DID NOT PASS'
        exit 1
    fi
}

main "$@"
