#!/usr/bin/env sh

main() {
    if ! ./scripts/tests.sh "$@"; then
        echo '!! NORMAL TESTS DID NOT PASS'
        exit 1
    fi

    printf '****** Press enter to start failing tests testing ******'
    read -r

    export NOBREAK=1 TESTDIR=tests_fail

    if ./scripts/tests.sh "$@"; then
        echo '!! NOT PASSING TESTS DID NOT PASS'
        exit 2
    fi

    printf '****** Press enter to start example testing ******'
    read -r

    export NOBREAK='' TESTDIR=examples

    if ! ./scripts/tests.sh "$@"; then
        echo '!! EXAMPLES DID NOT PASS'
        exit 1
    fi
}

main "$@"
