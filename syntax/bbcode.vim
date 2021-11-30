if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syn case ignore
syn spell toplevel

syn region bbcodeString contained start=+"+ end=+"+ contains=@NoSpell
syn region bbcodeString contained start=+'+ end=+'+ contains=@NoSpell

syn region bbcodeTag start=+\[[^/]+ end=+\]+ contains=@NoSpell,bbcodeString
syn region bbcodeEndTag start=+\[/+ end=+\]+ contains=@NoSpell

syn cluster bbcodeTop contains=@Spell,bbcodeTag,bbcodeEndTag

syn region bbcodeB start=+\[b\]+ end=+\[/b\]+me=e-4 contains=@bbcodeTop
syn region bbcodeU start=+\[u\]+ end=+\[/u\]+me=e-4 contains=@bbcodeTop

syn region bbcodeQuote start=+\[quote+ end=+\[/quote\]+me=e-8 contains=@bbcodeTop

hi link bbcodeTag Function
hi link bbcodeEndTag Identifier
hi link bbcodeString String
hi link bbcodeQuote Comment

hi def bbcodeB      gui=bold
hi def bbcodeU      gui=underline
hi def bbcodeQuote  guifg=#888888

let b:current_syntax = "bbcode"
