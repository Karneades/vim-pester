# vim-pester
A Vim plugin for PowerShell [Pester](https://github.com/pester/Pester) syntax highlighting.

From the Pester project:
> Pester provides a framework for running unit tests to execute and validate
> PowerShell commands from within PowerShell. Pester consists of a simple set
> of functions that expose a testing domain-specific language (DSL) for
> isolating, running, evaluating and reporting the results of PowerShell
> commands.

I didn't find any existing syntax highlighting for Pester scripts which are basically
PowerShell scripts with additional Pester commands. **vim-pester extends vim-ps1
for these additional Pester specific keywords**.

vim-pester will set the filetype to "ps1pester" and is triggered for filenames
with "\*.Tests.ps1" (according to the Pester documentation) and uses `runtime!
syntax/ps1.vim` to include all of the highlighting of ps1.vim (see
"Dependencies" below).

Use the following in your vimrc to enable syntax highlighting and indenting:

```VimL
syntax on
filetype plugin indent on
```

For indenting it's only the fix for # so that it not jumps to the beginning of
the line while in insert mode.

## Dependencies
vim-pester depends on the Vim plugin [vim-ps1](https://github.com/PProvost/vim-ps1) 
for PowerShell syntax highlighting and folding.

## Code Snippets
Code snippets for Pester (i.a. from [Pester ISE snippets](https://github.com/pester/Pester/tree/30b8b240d21e92dde701350c9699567b99e150e5/Snippets))
are available for using in combination with the simple and 
lightweight [code complete](https://github.com/mbbill/code\_complete) 
plugin. The snippets in the file [ps1pester\_snippets.vim](snippets/ps1pester\_snippets.vim) 
can be used by setting the option `g:user_defined_snippets` in your vimrc or by coping the content 
into your existing snippet file.

For example, you can type `describe<TAB>` (when using the default completion
key) and it will be exanded to the following and you are able to jump between
the fields with <TAB>. 

``` PowerShell
Describe '<...>' {
	<...>
}
```
Available snippets:

	describe, context, it, shouldbe, shouldbeexactly, shouldbelike,
	shouldbelikeExactly, shouldbegreater, shouldbeless, shouldbenull,
	shouldcontain, shouldcontainexactly, shouldexist, shouldmatch,
	shouldmatchexactly, shouldnotbe, shouldnotcontain, shouldnotexist,
	shouldnotmatch, shouldthrow, shouldnotthrow, shouldbeoftype, beforeeach,
	aftereach, beforeall, afterall, mock, newmockobject, assertmockcalled,
	inmodulescope, settestinconclusive

You can put the following line into your vimrc to use \<ctrl-n\> and
\<ctrl-p\> for word completion:

	set dictionary+=~\path-to-snippet-file\ps1pester_snippets.vim

The snippets could be also ported to the more heavy-weight and well-known 
[UltiSnips](https://github.com/SirVer/ultisnips) or 
[SnipMate](https://github.com/garbas/vim-snipmate). 
But currently, that's not yet the case.

You can also use the following *simple abbreviation in your vimrc without the 
need for any further plugins*.

```VimL
:iab Describe Describe{<CR>}<ESC>kwi
:iab Context Context{<CR>}<ESC>kwi
:iab It It{<CR>}<ESC>kwi
...
```

## Tags

Add the following lines to your ctags.conf to build the tags for Pester
describe blocks and to build tags for PowerShell scripts. Remove
"xxxxxCommentxxxxx" if you would like to have also the variable definitions.

```
--langdef=pester
--langmap=pester:.ps1
--regex-pester=/describe\s+'(.*)'/\1/m, method/i

--langdef=powershell
--langmap=powershell:.psm1.ps1
--regex-powershell=/function\s+(script:)?([a-zA-Z\-]+)/\2/m, method/i
--regex-powershell=/xxxxxCommentxxxxx\s*\[.*\]\s*\$([a-zA-Z\-]+)/\1/v, variable/i
--regex-powershell=/xxxxxCommentxxxxx\$global:([a-zA-Z\-]+)/\1/v, globalvariable/i
```

Set the following [taglist](https://github.com/vim-scripts/taglist.vim)
settings if needed.

```
let g:tlist_ps1_settings = 'powershell;m:method'
let g:tlist_ps1pester_settings = 'pester;m:method'
```

Use the [ctags](http://ctags.sourceforge.net/) command to generate the tags.

```
ctags -R --languages=pester
ctags -R --languages=powershell
```

## Changelog

The format is based on [Keep a Changelog](http://kgbeepachangelog.com/) 
and this project adheres to [Semantic Versioning](http://semver.org/).

### [Unreleased]

### [0.3.0] - 2016-12-25
#### Added
* [Code snippets](snippets/ps1pester\_snippets.vim) for using with 
	the [code complete](https://github.com/mbbill/code\_complete) plugin.
* Add new syntax keywords: afterall, beforeall.

### [0.2.0] - 2016-12-21
#### Added
* Own filetype plugin and indent files (clone of vim-ps1) to be able to apply
	the same PowerShell specific indentation for comments ('#')

#### Changed
* Change filetype detection to more specific Pester filenames with a point in front
	of "Tests" ("\*.Tests.ps1").

### [0.1.0] - 2016-12-20
#### Added
* Basic syntax highlighting for Pester commands according to the [Pester
	command
	reference](https://github.com/pester/Pester/wiki/Home/60a9188f2133f164b71fba3cfb184f6a2dcf796c#command-reference)
