set number
set cursorline
map <F4> : set nu!<BAR>set nonu?<CR>
set ic
set tabstop=4
set shiftwidth=4
set mouse=vc
""" reference: https://github.com/changemewtf/no_plugins
" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack
" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags


" AUTOCOMPLETE:
" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option
" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list


" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings


" Minimalist Vim Plugin Manager 
call plug#begin('~/.vim/plugged')

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" On-demand loading
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" Plug 'garbas/vim-snipmate'
" Plug 'marcweber/vim-addon-mw-utils'
Plug 'Shougo/neocomplcache'
" https://github.com/haystackandroid/seabird
" Plug 'nightsense/seabird'
" PlugUpdate
map <F5> :NERDTreeToggle<CR>

call plug#end()

colorscheme spacegray
let g:spacegray_underline_search = 1
let g:spacegray_low_contrast = 1


let g:neocomplcache_enable_at_startup = 1 
let g:neocomplcache_enable_smart_case = 1 
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
inoremap <expr><TAB> pumvisible()?"\<C-n>" : "\<TAB>"
