# rysc(1) completion                                    -*- shell-script -*-

_rysc() {
    local words cword cmd
    _init_completion -s || return

    for ((cmd = 1; cmd <= cword; cmd++)); do
        if [[ ${words[cmd]} == -* ]]; then
            COMPREPLY=(-help -debug -release
                -linux-elf64-x86_64-nasm -run --
                -o -strip -quiet -verbose
                -typecheck -no-typecheck)
        fi
    done
} && complete -F _rysc -o bashdefault -o default rysc

# ex: filetype=sh
