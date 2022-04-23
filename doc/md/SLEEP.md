# Sleep instruction

`sleep` in the rys programming language is an `instruction`
which can sleep for a set amount of seconds and nanoseconds
via `nanosleep` syscall

`sleep` instruction takes two arguments:

-   Seconds: Integer between 0 and 2147483647, the amount of seconds to sleep for
-   Nanoseconds: Integer between 0 and 999999999, The amount of nanoseconds to sleep for

And it returns nothing

Example of sleep:

```lua
150 5 sleep  -- sleeps for 5 seconds and 150 nanoseconds
```

Example of how `sleep` can be used in [the hello sleeping example](/examples/hello_sleep.rys)
