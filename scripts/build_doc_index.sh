#!/usr/bin/env sh

set -e

main() {
    rm -f doc/README.md

    {
        echo "# Rys documentation index"

        for file in doc/md/*; do
            echo "- [$(head -n 1 "$file" | sed 's/^# //')](/$file)"
        done
    } >doc/README.md
}

main "$@"
