#!/usr/bin/env sh

set -xe

main() {
    git add -A
    git commit -sa
    git push -u origin main
}

main "$@"
