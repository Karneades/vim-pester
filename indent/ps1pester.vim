" Vim indent file
" Language:           Windows PowerShell Pester extension
" Maintainer:         Karneades
" Version:            0.3.0
" Project Repository: https://github.com/Karneades/vim-pester

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
	finish
endif
let b:did_indent = 1

" smartindent is good enough for powershell
setlocal smartindent
" disable the indent removal for # marks
inoremap # X<BS>#
inoremap # X#

let b:undo_indent = "setl si<"
