# Charz keyword

`charz` in the rys programming language is a `keyword`
which can convert `X` amount of supplied [ASCII values](https://ascii.cl/)
to a string

`charz` keyword takes:

-   Charcode: Any ammount of integers that are valid ASCII codes
-   Charcode_count: Charcode count, an integer

And it returns nothing

Example of charz:

```lua
10 41 58  -- This is ":)\n"
3 charz 1 writefd 1 drop 0 exit
```

As I myself find rys strings pretty stupid
I think this feature is useful but probably
a but too low-level, so you can make a script
to generate it for you :)

For example in python:

```py
def string_to_charz(string: str, escape: bool = True) -> str:
    if escape:
        # Escapes stuff like \n to an actual newline
        string = string.encode("raw_unicode_escape", errors="ignore").decode(
            "unicode_escape", errors="ignore"
        )

    # Reverses the string as rys is a
    # Stack based language
    string = string[::-1]

    charcodes: tuple[str, ...] = tuple(map(lambda char: str(ord(char)), string))

    return f"{' '.join(charcodes)} {len(charcodes)} charz"
```

Example usage:

```py
print(string_to_charz(r"hello\n"))
print(string_to_charz(r"hello\n", False))
```

Example of how `charz` can be used in [the charz hello world example](/examples/charz_hello_world.rys)
