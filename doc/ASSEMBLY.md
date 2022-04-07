# Assembly

`assembly` in the rys programming language is a `keyword`
which can inject pure user-specified assembly to generated
assembly

`assembly` keyword takes:

-   Assembly: Any ammount of strings that are valid assembly
    in the main/\_start label context
-   Assembly_count: Assembly line count, an integer

And it returns nothing

Example of assembly:

```lua
"   syscall"
"   mov rdi, 0"
"   mov rax, 60" 3 assembly
```

Example of how `assembly` can be used in [the assembly exit](/examples/assembly_exit.rys)
