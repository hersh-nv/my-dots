set nocompatible              " be iMproved, required
syntax on
filetype off                  " required

"""" ----------------------------
"""" VUNDLE 
"""" ----------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim' "required
	"Plugin 'crusoexia/vim-dracula'
call vundle#end()            " required
filetype plugin indent on    " required


"""" ----------------------------
"""" VIM-PLUG
"""" ----------------------------
call plug#begin('~/.vim/plugged')
	Plug 'dracula/vim', { 'as': 'dracula' }
	"Plug 'terryma/vim-multiple-cursors'
	Plug 'jooize/vim-colemak'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
call plug#end()


"""" ----------------------------
"""" MISC GUI
"""" ----------------------------
set number
set ruler
set mouse=a

set tabstop=4
set shiftwidth=4
set noexpandtab


"""" ----------------------------
"""" BACKUPS
"""" ----------------------------
set nobackup
set noswapfile
set nowritebackup


"""" ----------------------------
"""" AIRLINE
"""" ----------------------------
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1


"""" ----------------------------
"""" COLOURSCHEME 
"""" ----------------------------
colorscheme dracula
hi Normal ctermbg=None

