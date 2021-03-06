" vim: ft=vim

" https://github.com/junegunn/vim-plug
call plug#begin("$HOME/.dotfiles/modules/vim-plug/modules")
Plug 'ervandew/supertab'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'dense-analysis/ale'
Plug 'mhinz/vim-signify'
call plug#end()

" Conf

" vim-signify (https://github.com/mhinz/vim-signify)
nnoremap gu :SignifyHunkUndo<CR>

" VimDevIcons (https://github.com/ryanoasis/vim-devicons)

let g:WebDevIconsUnicodeDecorateFolderNodes=1
let g:DevIconsEnableFoldersOpenClose=1

let g:lightline = {
	\ 'colorscheme': 'nord',
	\ 'component_function': {
	\   'filetype': 'MyFiletype',
	\   'fileformat': 'MyFileformat',
	\ } }

function! MyFiletype()
	if exists('*WebDevIconsGetFileTypeSymbol')  " support for vim-devicons
		return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
	else
		return &filetype
	endif
endfunction

function! MyFileformat()
	if exists('*WebDevIconsGetFileTypeSymbol')  " support for vim-devicons
		return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
	else
		return &fileformat
	endif
endfunction
