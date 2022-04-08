# Rysi

> Rys semi-interpreter written in POSIX sh

# Why?

Sometimes you just want a working REPL of sort to test
a piece of code so I created this...

# How?

It's just a wrapper around the rysc compiler
and it just gets ran, written to a file and
compiled automatically when you just have to
write the code :)

# Dependencies

-   (optional) rlwrap -- GNU readline support
-   Any POSIX complient shell

# Configuration

-   Everything rysc supports
-   `rysc` environment variable = path to the rysc compiler
