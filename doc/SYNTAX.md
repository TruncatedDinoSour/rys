# Syntax

The syntax of the rys programming language is quite simple.
To push values you just type them and to do an operation
on them you add functions, keywords and so on at the end

For example

(Hello world in rys)

```lua
"Hello world\n"  -- Push "hello world\n" on the stack
1                -- Push 1 on the stack
writefd          -- Write `hello world\n` to file descriptor `1`
1                -- Push `1` on the stack
drop             -- Drop `1` element from the stack
0                -- Push 0 on the stack
exit             -- Exit with code 0
```

`--` is a comment
