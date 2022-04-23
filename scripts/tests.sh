#!/usr/bin/env bash

set -e

main() {
    rm -rf built_tests /tmp/rysoops
    mkdir -p built_tests/include

    cd built_tests

    echo 'GENERATE include/hello_world.rys'
    echo '"hello world\n" 1 writefd 1 drop' >include/hello_world_b.rys
    echo '"include/hello_world_b.rys" include' >include/hello_world.rys

    for rys_test in $(find ../"${TESTDIR:-tests}" -type f); do
        export ohno=
        echo "$rys_test"

        echo "TEST $rys_test"
        ../src/rysc "$rys_test" -linux-elf64-x86_64-nasm "$@" || export ohno=1
        ./"$(basename "$rys_test" | cut -d '.' -f 1)" || export ohno=1
        echo

        if [ "$ohno" ]; then
            touch /tmp/rysoops
            [ "$NOBREAK" ] || break
        fi
    done 2>&1 | tee build.log

    [ ! -f /tmp/rysoops ] || exit 1
}

main "$@"
