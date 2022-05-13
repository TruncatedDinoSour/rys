#!/usr/bin/env bash

. ./scripts/config.sh

[ "$DEBUG" ] && set -x
set -e

use() {
    command -v -- "$1" >/dev/null ||
        (echo "please install: $1" >&2 && exit 1)
}

main() {
    printf 'Checking for requirements... '
    for req in "${UNINIT_REQUIRE[@]}"; do
        use "$req"
    done
    echo 'done'

    # ---

    printf 'Unlinking files... '

    while read -r file; do
        [ -x "$file" ] || continue

        sl="$BINDIR$(basename -- "$file")"
        [ -h "$sl" ] && unlink "$sl"
    done <<<"$(find "${SYM_DIRS[@]}" -type f)"

    echo 'done'

    # ---

    printf 'Removing bash completion files... '
    sl="$COMPDIR/rysc"
    [ -h "$sl" ] && unlink "$sl"
    echo 'done'

    # ---

    if command -v vim >/dev/null; then
        printf 'Removing vim files... '

        # Syntax file

        sl="$VIMDIR/syntax/rys.vim"
        [ -h "$sl" ] && unlink "$sl"

        # File detection

        sl="$VIMDIR/ftdetect/rys.vim"
        [ -h "$sl" ] && unlink "$sl"

        echo 'done'
    fi

    # ---

    if command -v pip >/dev/null; then
        printf 'Uninstalling python requirements... '
        pip uninstall -r requirements.txt
        echo 'done'
    fi

    # ---

    echo 'Dev setup reverted!'
}

main "$@"
