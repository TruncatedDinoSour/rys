# Writefd

`writefd` in the rys programming language is an `instruction`
which can write textual data to a specified file descriptor number

`writefd` instruction takes two arguments:

    - FD: File descriptor number (for example `2` for STDERROR)
    - Data: text to write to that file descriptor

Example of writefd:

```lua
"Hello world" 1 writeout  -- Write "Hello world" to STDOUT
```

Example of how `writefd` can be used in [the hello world example](/examples/hello_world.rys)
