# Math

Rys programming language has 6 arithmetic operators:

-   `+` (plus) -- Add two numbers
-   `-` (minus) -- Subtract two numbers
-   `*` (multiply) -- Multiply two numbers
-   `/` (divide) -- Divide two numbers
-   `%` (modulo) -- Return two number division remainder
-   `**` (exponent) -- Raise one number to the power of another

Rys math is only precise up to 0th decimal place,
I.e. the full part

Rys does not support floating point integers _yet_

Syntax for all of them is the same:

```
<v2> <v1> <op>
```

Which is (in non-stack-based languages (like python))

```
<v1> <op> <v2>
```

For example:

```lua
2 5 -
```

Which is

```python
5 - 2
```
