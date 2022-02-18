# Drop

Drop is a `keyword` in the rys programming language
which drops/pops/removes `n` amount of elements
from the main stack

This is useful when a function or a keyword
you called returned a value you don't want or need to
use

For example `writefd` returns amount of bytes
it will write (in compile time) and how much it successfully wrote
in run time (refer to [write(2)](https://man7.org/linux/man-pages/man2/write.2.html))

`drop` takes one argument: The amount of elements to drop from the stack (for example `3`)

Example of `drop`:

```lua
3 drop
```

You can see an example of how `drop` can be used in [rys hello world example](/examples/hello_world.rys)
