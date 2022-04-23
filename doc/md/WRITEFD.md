# Writefd instruction

`writefd` in the rys programming language is an `instruction`
which can write textual data to a specified file descriptor number

`writefd` instruction takes two arguments:

-   Data: text to write to that file descriptor
-   FD: File descriptor number (for example `2` for STDERROR)

And it returns the string length

Example of writefd:

```lua
"Hello world" 1 writeout  -- Write "Hello world" to STDOUT
1 drop                    -- Drops bytes written
```

`data` can also be a number:

```lua
1337 1 writeout  -- Write "Hello world" to STDOUT
1 drop                    -- Drops bytes written
```

It will get converted to a string...

Example of how `writefd` can be used in [the hello world example](/examples/hello_world.rys)
