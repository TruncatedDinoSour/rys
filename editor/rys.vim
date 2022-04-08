" Vim syntax file
" Language:     Rys
" Maintainer:   Ari Archer <ari.web.xyz@gmail.com>
" Last Change:  2022 Apr 1

" Usage Instructions
" Put this file in ~/.vim/syntax/rys.vim
" and add in your .vimrc file the next line:
" autocmd BufRead,BufNewFile *.rys set filetype=rys

scriptencoding utf-8

if exists("b:current_syntax")
    finish
endif


" TODOs
syntax keyword rysTodos TODO XXX FIXME NOTE


" Language keywords
syntax keyword rysKeywords drop assembly charz


" Language functions
syntax keyword rysFunctions exit writefd


" Escapes
syntax match rysEscape +\\[abfnrtv'"\\]+ contained
syntax match rysEscape "\\\o\{1,3}" contained
syntax match rysEscape "\\x\x\{2}" contained
syntax match rysEscape "\%(\\u\x\{4}\|\\U\x\{8}\)" contained
syntax match rysEscape "\\N{\a\+\%(\s\a\+\)*}" contained
syntax match rysEscape "\\$"


" Numbers
syntax match rysNumber "\<\d*\>"


" Comments
syntax region rysCommentLine start="--" end="$" contains=rysTodos


" Strings
syntax region rysString start=/\v"/ skip=/\v\\./ end=/\v"/ contains=rysEscape


" Operators
syntax keyword rysOperator + - * / %


" Set highlights
highlight default link rysTodos Todo
highlight default link rysKeywords Keyword
highlight default link rysFunctions Function
highlight default link rysCommentLine Comment
highlight default link rysString String
highlight default link rysEscape Special
highlight default link rysNumber Number
highlight default link rysOperator Operator


" Set syntax
let b:current_syntax = "rys"

