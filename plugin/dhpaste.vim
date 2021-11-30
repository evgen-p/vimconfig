" uebernet pastebin; modeled on dhpastebin.pl
"
" We provide a command, DHPaste, and a function (though I'd be surprised to
" see someone poking at this directly).  To paste things up to DH's internal
" pastebin, use:
"
"    :DHPaste Title goes here!
"
" It'll do the paste, and spit the url back at you.
"
" The command will work on a selected range, or, if none given, the entire
" buffer.

if ! exists('g:ndn_pastebin')
    let g:ndn_pastebin = '/ndn/dh/bin/pastebin.pl'
endif

function! DHPaste(count, line1, line2, ...) abort
    let content = join(getline(a:line1, a:line2), "\n")
    let url = system(g:ndn_pastebin . ' ' . shellescape(join(a:000, ' ')), content)
    echomsg url
endfunction

command! -nargs=* -range=% DHPaste :call DHPaste(<count>, <line1>, <line2>, <f-args>)
