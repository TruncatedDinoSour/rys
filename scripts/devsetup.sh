#!/usr/bin/env bash

[ "$DEBUG" ] && set -x
set -e

DEV_PKGS=('binutils (for `strip` and `ld`)'
    'nasm (for assembly compilation)'
    'vim (for editor support)'
    'rlwrap (for rysi readline support)')
INIT_REQUIRE=(python3 pip ln pwd)
SYM_DIRS=(extras src)
MESSAGES=()
BINDIR="$HOME/.local/bin/"
COMPDIR="$HOME/.local/share/bash-completion/completions"

use() {
    command -v -- "$1" >/dev/null ||
        (echo "please install: $1" >&2 && exit 1)
}

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

    MESSAGES+=(f"Make sure $BINDIR is in your PATH (add this to your bashrc or whatever): export PATH=\"\$PATH:$BINDIR\"")

    echo 'done'

    # ---

    printf 'Setting up bash completion... '

    mkdir -p -- "$COMPDIR"
    sl="$COMPDIR/rysc"

    [ -h "$sl" ] && unlink "$sl"
    ln -s "$(pwd)/completions/rysc.bash" "$sl"

    echo 'done'

    # ---

    printf 'Setting up vim... '

    mkdir -p -- "$HOME/.vim/syntax"
    sl="$HOME/.vim/syntax/rys.vim"

    [ -h "$sl" ] && unlink "$sl"
    ln -s "$(pwd)/editor/rys.vim" "$sl"

    echo 'done'

    # ---

    printf 'Installing python requirements... '
    pip install --quiet --user -r requirements.txt
    echo 'done'

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
