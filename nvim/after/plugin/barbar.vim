let s:currentTab = '#0b2942'
let s:white      = '#c3ccdc'
let s:inactiveTab = '#01111d'
let s:inactiveTabFg = '#5b7a93'

let s:grey_blue  = '#7c8f8f'
let s:cadet_blue = '#a1aab8'

let s:none       = 'NONE'
let s:tabFill 	 = '#011627'

exe 'hi BufferCurrent      guibg=' . s:currentTab . '  guifg=' . s:white
exe 'hi BufferInactive     guibg=' . s:inactiveTab . ' guifg=' . s:inactiveTabFg

exe 'hi BufferCurrentMod   guibg=' . s:currentTab . '  guifg=' . s:white
exe 'hi BufferVisibleMod   guibg=' . s:inactiveTab . '  guifg=' . s:inactiveTabFg

exe 'hi BufferTabpageFill  guibg=' . s:tabFill . ' guifg=' . s:none
exe 'hi BufferInactiveSign guibg=' . s:none . ' guifg=' . s:cadet_blue

" barbar.nvim plugin
" exec 'highlight BufferCurrentSign  guibg=' . s:dark_blue . '  guifg=' . s:blue
" exec 'highlight BufferVisible      guibg=' . s:dark_blue . '  guifg=' . s:grey_blue
" exec 'highlight BufferVisibleMod   guibg=' . s:dark_blue . '  guifg=' . s:tan
" exec 'highlight BufferVisibleSign  guibg=' . s:dark_blue . '  guifg=' . s:grey_blue
" exec 'highlight BufferInactive     guibg=' . s:slate_blue . ' guifg=' . s:grey_blue
" exec 'highlight BufferInactiveMod  guibg=' . s:slate_blue . ' guifg=' . s:tan
" exec 'highlight BufferInactiveSign guibg=' . s:slate_blue . ' guifg=' . s:cadet_blue
