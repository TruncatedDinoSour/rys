#!/usr/bin/env bash

. ./scripts/config.sh

[ "$DEBUG" ] && set -x
set -e

MESSAGES=()

main() {
    printf 'Checking for requirements... '
    for req in "${INIT_REQUIRE[@]}"; do
        use "$req"
    done
    echo 'done'

    # ---

    printf 'Setting up symlinks... '

    mkdir -p -- "$BINDIR"
    while read -r file; do
        [ -x "$file" ] || continue

        sl="$BINDIR$(basename -- "$file")"

        [ -h "$sl" ] && unlink "$sl"
        ln -s "$(pwd)/$file" "$sl"
    done <<<"$(find "${SYM_DIRS[@]}" -type f)"

    MESSAGES+=("Make sure $BINDIR is in your PATH (add this to your bashrc or whatever): export PATH=\"\$PATH:$BINDIR\"")

    echo 'done'

    # ---

    printf 'Setting up bash completion... '

    mkdir -p -- "$COMPDIR"
    sl="$COMPDIR/rysc"

    [ -h "$sl" ] && unlink "$sl"
    ln -s "$(pwd)/completions/rysc.bash" "$sl"

    echo 'done'

    # ---

    if command -v vim >/dev/null; then
        printf 'Setting up vim... '

        # Syntax file

        mkdir -p -- "$VIMDIR/syntax"
        sl="$VIMDIR/syntax/rys.vim"

        [ -h "$sl" ] && unlink "$sl"
        ln -s "$(pwd)/editor/rys.vim" "$sl"

        # File detection

        mkdir -p -- "$VIMDIR/ftdetect"
        sl="$VIMDIR/ftdetect/rys.vim"

        [ -h "$sl" ] && unlink "$sl"
        ln -s "$(pwd)/editor/rys.ftp.vim" "$sl"

        echo 'done'

        MESSAGES+=("You might need to add this to vimrc if syntax does not work: autocmd BufRead,BufNewFile *.rys set filetype=rys")
    fi

    # ---

    if command -v pip >/dev/null; then
        printf 'Installing python requirements... '
        pip install --quiet --user -r requirements.txt
        echo 'done'
    else
        MESSAGES+=("Please install all python requirements from requirements.txt file")
    fi

    # ---

    echo 'Setup finished!'

    # ---

    if [ "${MESSAGES[0]}" ]; then
        echo
        echo ' ** Messages:'

        for message in "${MESSAGES[@]}"; do
            echo " * $message"
        done
    fi

    # ---

    echo
    echo ' ** Extra packages:'

    for package in "${DEV_PKGS[@]}"; do
        echo " * $package"
    done
}

main "$@"
