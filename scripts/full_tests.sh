#!/usr/bin/env sh

set -e

cnt() {
    printf '****** Press enter to continue ******'
    read -r
}

main() {
    if ! ./scripts/tests.sh "$@"; then
        echo '!! NORMAL TESTS DID NOT PASS'
        exit 1
    fi

    cnt

    export NOBREAK=1 TESTDIR=tests_fail
    if ./scripts/tests.sh "$@"; then
        echo '!! NOT PASSING TESTS DID NOT PASS'
        exit 2
    fi

    cnt

    export NOBREAK='' TESTDIR=examples
    if ! ./scripts/tests.sh "$@"; then
        echo '!! EXAMPLES DID NOT PASS'
        exit 3
    fi
}

main "$@"
