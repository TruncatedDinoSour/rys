# Sassert keyword

Sassert is a `keyword` in the rys programming language
which statically (compile-time) asserts values
and bails out if it's false

It takes one argument: `value`
which can be any type, it will get
interpreted as a boolean (integer 1/0)

It returns the value that has been asserted,
changes nothing on the stack

Example:

```lua
1   sassert  -- true
0   sassert  -- false
""  sassert  -- false
"A" sassert  -- true
" " sassert  -- true
```

It essentially acts like a proxy
which checks if a value is truthy or falsy
