# Include pre-processed keyword

`include` in the rys programming language is a `semi-keyword`
which includes a file

`include` semi-keyword takes:

-   file_path: A string which is well... The file path

It returns the file included

`Include` example:

#### a.rys

```lua
"hello world" 1 writefd clear
```

#### b.rys

```lua
"a.rys" include 0 exit
```

Then just compile `b.rys` and get the hello world :)

## Stack behaviour

The included file should handle all stack stuff
where the parent should be just able to use it
