#!/usr/bin/env sh

set -e

main() {
    rm -f doc/README.md

    {
        echo "# Documentation index"

        for file in doc/*; do
            echo "- [$(head -n 1 "$file" | sed 's/^# //')]($(basename "$file"))"
        done
    } >doc/README.md
}

main "$@"
