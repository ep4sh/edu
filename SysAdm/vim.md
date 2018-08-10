# Vim. Спасибо тебе

Все настройки хранятся в .vimrc:
```
set number // названия строк
set expandtap // разбить таб на пробелы
set tabstop=2 //два пробела за 1 таб
set hlsearch // добавить подсветку при поиске
set incsearch // инкрементальное вхождение при поиске

set background=dark // цвет схемы
hi Comment ctermfg=LightBlue // цвет комментов
```

Менеджер планинов:  
```Vim-plug```

для установки плагинов:

1. :source ~/.vimrc
2. :PlugInstall

Для маппинга плагинов:
```
"mapping //коммент
map <C-n> :NERDTreeToggle<CR> // маппинг на CTRL+N
```




*************************************
**мой VIMRC**

```

1 set number
2 syntax on
3
4 set background=dark
5
6 call plug#begin('~/.vim/plugged')
7 Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
8 Plug 'morhetz/gruvbox'
9 Plug 'Valloric/YouCompleteMe'
10 call plug#end()
11
12 "mapping
13 map <C-n> :NERDTreeToggle<CR>

```
******************


