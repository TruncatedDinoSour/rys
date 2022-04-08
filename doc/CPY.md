# Cpy

`cpy` in the rys programming language is an `instruction`
which copes `n` amount of items on the stack

`cpy` keyword takes:

-   Amount: The amount of items to copy onto the stack from the stack

And it returns the copies items

Example of cpy:

```lua
10 73 72 3 cpy          -- Copy "HI\n" (now "HI\n" "HI\n")
stacksz charz           -- Convert both to string
1 writefd stacksz drop  -- Write it out to STDOUT
0 exit                  -- Exit

------------
--> HI
--> HI
------------
```

Example of how `cpy` can be used in [the hi cpy example](/examples/cpy_hi.rys)
