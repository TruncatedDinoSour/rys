<p align="center">
    <img src="/logo/rys.png" alt="rys logo" width="50%"/>
</p>

<h1 align="center">Rys programming language</h1>

<p align="center">
    <i>A reverse polish notation, stack based, concatinative, compiled programming language</i>
</p>

## Development setup

Just run the [devsetup.sh shell script](/scripts/devsetup.sh),
to remove (most of) the effects of development setup script run
the [undev.sh shell script](/scripts/undev.sh)

If you want debug output just set the `DEBUG` environment
variable, for example:

```bash
$ DEBUG=1 ./scripts/devsetup.sh
```

## Requirements

-   `ld` linker
-   `nasm` assembly compiler
-   `python3.9` and up
-   Python `typing`
-   Linux

## Note

Do not contribute to the python script, I will not be merging
any PRs related to it, thanks if you decide to, but I really
want to get rid of it as fast as I can <3

## Project structure

-   [completions](/completions) -- Shell completions
-   [doc](/doc) -- The documentation
-   [editor](/editor) -- Editor support
-   [examples](/examples) -- Rys code examples
-   [extras](/extras) -- Extra rys utilities
-   [logo](/logo) -- Rys logo
-   [scripts](/scrips) -- Where scripts go
-   [src](/src) -- Main source code
-   [tests](/tests) -- Passing tests
-   [tests_fail](/tests_fail) -- Purposely failing tests
-   [.editorconfig](/.editorconfig) -- [Editdorconfig](https://editorconfig.org/) config
-   [.gitignore](/.gitignore) -- Git cli ignore list
-   [.shellcheckrc](/.shellcheckrc) -- Shellcheck config
-   [CONTRIBUTING.md](CONTRIBUTING.md) -- Contributing rules
-   [LICENSE](/LICENSE) -- Project license
-   [README.md](/README.md) -- Project readme/index file
-   [TODO.md](/TODO.md) -- TODOs/accomplishments I want to finish
-   [requirements.txt](/requirements.txt) -- Python requirements
-   [tox.ini](/tox.ini) -- Python tox config

## Examples

Check the [examples](/examples) folder

## Documentation

All in [doc](/doc) folder

## Editor support

-   [ViM](/editor/rys.vim)
