#!/usr/bin/env sh

set -xe

main() {
    ./scripts/full_tests.sh
    ./scripts/build_doc_index.sh

    git add -A
    git commit -sa
    git push -u origin main
}

main "$@"
