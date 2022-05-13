export DEV_PKGS=('binutils (for `strip` and `ld`)'
    'nasm (for assembly compilation)'
    'vim (for editor support)'
    'rlwrap (for rysi readline support)')
export INIT_REQUIRE=(python3 ln pwd mkdir basename unlink)
export UNINIT_REQUIRE=(pwd basename unlink)
export SYM_DIRS=(extras src)
export BINDIR="$HOME/.local/bin/"
export COMPDIR="$HOME/.local/share/bash-completion/completions"
export VIMDIR="$HOME/.vim"

use() {
    command -v -- "$1" >/dev/null ||
        (echo "please install: $1" >&2 && exit 1)
}
