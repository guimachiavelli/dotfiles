" guimachiavelli vim setup

set nocompatible              " be iMproved, required

" Plugin setup {
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'gmarik/vundle'
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'tomtom/tlib_vim'
    Plugin 'mileszs/ack.vim'

    Plugin 'scrooloose/nerdtree'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'spf13/vim-colors'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-repeat'
    Plugin 'spf13/vim-autoclose'
    Plugin 'kien/ctrlp.vim'
    Plugin 'tacahiroy/ctrlp-funky'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'bling/vim-airline'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'mbbill/undotree'
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'mhinz/vim-signify'
    Plugin 'gcmt/wildfire.vim'

    Plugin 'scrooloose/syntastic'
    Plugin 'tpope/vim-fugitive'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'godlygeek/tabular'

    Plugin 'elzr/vim-json'
    Plugin 'pangloss/vim-javascript'
    Plugin 'jelera/vim-javascript-syntax'
    Plugin 'briancollins/vim-jst'
    Plugin 'moll/vim-node'
    Plugin 'kchmck/vim-coffee-script'
    Plugin 'amirh/HTML-AutoCloseTag'
    Plugin 'hail2u/vim-css3-syntax'
    Plugin 'gorodinskiy/vim-coloresque'
    Plugin 'tpope/vim-haml'
    Plugin 'othree/javascript-libraries-syntax.vim'

    Plugin 'tpope/vim-rails'
    Plugin 'vim-ruby/vim-ruby'
    
    Plugin 'jpalardy/vim-slime'
    Plugin 'amdt/vim-niji'

    call vundle#end()
"}


" General {

    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set background=dark         " Assume a dark background
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    set clipboard=unnamed,unnamedplus
    set clipboard=unnamed

    set noswapfile

    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=500                     " Store a ton of history (default is 20)
    set spell                           " Spell checking on
    set spell spelllang=en_gb       	" Default spelling language
    set hidden                          " Allow buffer switching without saving

" }

" Vim UI {

    if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="high"
        let g:solarized_visibility="low"
    endif

    color solarized                 " Load a colorscheme
    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr
    set tabpagemax=10               " Only show 10 tabs
    set showmode                    " Display the current mode
    set cursorline                  " Highlight current line
    let &colorcolumn="80,".join(range(120,999),",")

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=5                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code

" }

" Formatting {

    set wrap 						" wrap lines
    set linebreak 					" wrap lines at words, not chars
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set expandtab
    set smarttab
    set visualbell
    set linespace=5                 " No extra spaces between rows
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set list
    set listchars=tab:\ \ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

" }


" GUI Settings {

    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256
        endif
"        set term=builtin_ansi       " Make arrow and other keys work
    endif

" }


" Key (re)Mappings {

    let mapleader = ','

    nmap <leader>l :bnext<CR>
    nmap <leader>h :bprevious<CR>

    " Close the current buffer and move to the previous one
    nmap <leader>bq :bp <BAR> bd #<CR>

    nmap <leader>bl :ls<CR>

    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk


    " The following two lines conflict with moving to top and
    " bottom of the screen
    " If you prefer that functionality, add the following to your
    " .vimrc.before.local file:
    "   let g:spf13_no_fastTabs = 1
    if !exists('g:spf13_no_fastTabs')
        map <S-H> gT
        map <S-L> gt
    endif

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Allow using the repeat operator with a visual selection (!)
    vnoremap . :normal .<CR>

" }

" Plugins {

    " Misc {
        let g:NERDShutUp=1
    " }

    " AutoCloseTag {
        " Make it so AutoCloseTag works for xml and xhtml files as well
        au FileType xml ru ftplugin/html/autoclosetag.vim
        nmap <Leader>ac <Plug>ToggleAutoCloseMappings
    " }

    " NerdTree {
            map <C-e> <plug>NERDTreeTabsToggle<CR>
            map <leader>e :NERDTreeFind<CR>
            nmap <leader>nt :NERDTreeFind<CR>

            let NERDTreeShowBookmarks=0
            let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
            let NERDTreeChDirMode=0
            let NERDTreeQuitOnOpen=0
            let NERDTreeMouseMode=2
            let NERDTreeShowHidden=0
            let NERDTreeKeepTreeInNewTab=1
            let g:nerdtree_tabs_open_on_gui_startup=1

    " }

    " Tabularize {
            nmap <Leader>a& :Tabularize /&<CR>
            vmap <Leader>a& :Tabularize /&<CR>
            nmap <Leader>a= :Tabularize /=<CR>
            vmap <Leader>a= :Tabularize /=<CR>
            nmap <Leader>a: :Tabularize /:<CR>
            vmap <Leader>a: :Tabularize /:<CR>
            nmap <Leader>a:: :Tabularize /:\zs<CR>
            vmap <Leader>a:: :Tabularize /:\zs<CR>
            nmap <Leader>a, :Tabularize /,<CR>
            vmap <Leader>a, :Tabularize /,<CR>
            nmap <Leader>a,, :Tabularize /,\zs<CR>
            vmap <Leader>a,, :Tabularize /,\zs<CR>
            nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
            vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    " }


    " ctrlp {
        let g:ctrlp_working_path_mode = 'ra'
        nnoremap <silent> <D-t> :CtrlP<CR>
        nnoremap <silent> <D-r> :CtrlPMRU<CR>
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

        let g:ctrlp_user_command = {
            \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
        \ }

        " CtrlP extensions
        let g:ctrlp_extensions = ['funky']
        nnoremap <Leader>fu :CtrlPFunky<Cr>
    "}

    " Fugitive {
        if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
            nnoremap <silent> <leader>gs :Gstatus<CR>
            nnoremap <silent> <leader>gd :Gdiff<CR>
            nnoremap <silent> <leader>gc :Gcommit<CR>
            nnoremap <silent> <leader>gb :Gblame<CR>
            nnoremap <silent> <leader>gl :Glog<CR>
            nnoremap <silent> <leader>gp :Git push<CR>
            nnoremap <silent> <leader>gr :Gread<CR>
            nnoremap <silent> <leader>gw :Gwrite<CR>
            nnoremap <silent> <leader>ge :Gedit<CR>
            " Mnemonic _i_nteractive
            nnoremap <silent> <leader>gi :Git add -p %<CR>
            nnoremap <silent> <leader>gg :SignifyToggle<CR>
        endif
    "}

    " UndoTree {
        if isdirectory(expand("~/.vim/bundle/undotree/"))
            nnoremap <Leader>u :UndotreeToggle<CR>
            " If undotree is opened, it is likely one wants to interact with it.
            let g:undotree_SetFocusWhenToggle=1
        endif
    " }

    " indent_guides {
        if isdirectory(expand("~/.vim/bundle/vim-indent-guides/"))
            let g:indent_guides_start_level = 2
            let g:indent_guides_guide_size = 1
            let g:indent_guides_enable_on_vim_startup = 1
        endif
    " }

    " Wildfire {
    let g:wildfire_objects = {
            \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
            \ "html,xml" : ["at"],
            \ }
    " }

    " vim-airline {
        if isdirectory(expand("~/.vim/bundle/vim-airline/"))
            let g:airline_theme = 'solarized'
            let g:airline#extensions#tabline#enabled = 1
        endif
    " }
    
    " syntastic {
        "let g:syntastic_error_symbol = "✕"
        "let g:syntastic_warning_symbol = "⚠"
        let g:syntastic_javascript_checkers = ['jshint']
        let g:syntastic_quiet_messages = { }
        "let g:syntastic_debug=3
        let g:syntastic_javascript_jshint_args = '--config ' .  $HOME . '/.jshintrc'
    " }

    let g:slime_target = "tmux"
    let g:slime_default_config = {"socket_name": "default", "target_pane": "0"}



" Functions {

    " Strip whitespace {
    function! StripTrailingWhitespaces()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
    " }
    autocmd FileType c,cpp,java,php,ruby,python,javascript autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()

" }

" }



