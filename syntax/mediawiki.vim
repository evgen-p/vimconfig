" Wikipedia syntax file for Vim
" Published on Wikipedia in 2003-04 and declared authorless.

if exists("b:current_syntax")
    finish
endif

let main_syntax = "html"
ru! syntax/html.vim
unlet b:current_syntax

syn case ignore

syn spell toplevel
setlocal spell tw=0 fo-=a

" allowed tag names
syn keyword htmlTagName contained nowiki ref math

syn region wikiItalic   start=+'\@<!'''\@!+ end=+''+ contains=@Spell,wikiLink,wikiItalicBold
syn region wikiBold    start=+'''+   end=+'''+ contains=@Spell,wikiLink,wikiBoldItalic
syn region wikiBoldAndItalic start=+'''''+  end=+'''''+ contains=@Spell,wikiLink

syn region wikiBoldItalic contained start=+'\@<!'''\@!+ end=+''+ contains=@Spell,wikiLink
syn region wikiItalicBold contained start=+'''+   end=+'''+ contains=@Spell,wikiLink

syn region wikiHeading start="^=\+" end="=\+" oneline contains=@Spell,wikiLink
syn region wikiLink start="\[\[" end="\]\]\(s\|'s\|es\|ing\|\)"  oneline contains=wikiLink
syn region wikiLink start="\[http:" end="\]"  oneline
syn region wikiLink start="\[https:" end="\]"  oneline
syn region wikiLink start="\[ftp:" end="\]"  oneline
syn region wikiLink start="\[gopher:" end="\]"  oneline
syn region wikiLink start="\[news:" end="\]"  oneline
syn region wikiLink start="\[mailto:" end="\]"  oneline
syn region wikiTemplate start="{{" end="}}" contains=wikiTemplate

syn match wikiParaFormatChar /^[\:|\*|;|#]\+/
syn match wikiParaFormatChar /^-----*/
syn match wikiPre /^\ .*$/

syn include @TeX syntax/tex.vim
syntax region wikiTeX matchgroup=htmlTag start="<math>" end="</math>"  contains=@texMathZoneGroup 

" wiki highlighting

hi link wikiItalic  htmlItalic
hi link wikiBold  htmlBold

hi link wikiBoldItalic htmlBoldItalic
hi link wikiItalicBold htmlBoldItalic

hi link wikiBoldAndItalic htmlBoldItalic

hi link wikiHeading  htmlH1
hi link wikiLink  Underlined
hi link wikiTemplate  Special
hi link wikiParaFormatChar Special
hi link wikiPre  Constant
