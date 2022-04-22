#!/usr/bin/env sh

set -xe

main() {
    [ "$NOTEST" ] || ./scripts/full_tests.sh "$@"
    ./scripts/build_doc_index.sh

    git add -A
    git commit -sa
    git push -u origin "$(git rev-parse --abbrev-ref HEAD)"
}

main "$@"
