#!/usr/bin/env sh

set -xe

main() {
    ./scripts/full_tests.sh

    git add -A
    git commit -sa
    git push -u origin main
}

main "$@"
