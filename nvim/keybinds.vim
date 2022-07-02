let mapleader = " "

""copy paste in/outside vim
vnoremap <leader>y "+y
map <leader>p "+p

"" yank to end of line
nnoremap Y yg_

"" harpoon
nnoremap <silent><leader><leader> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>' :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <silent><leader>5 :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <silent><leader>6 :lua require("harpoon.ui").nav_file(6)<CR>
nnoremap <silent><leader>7 :lua require("harpoon.ui").nav_file(7)<CR>
nnoremap <silent><leader>8 :lua require("harpoon.ui").nav_file(8)<CR>
nnoremap <silent><leader>9 :lua require("harpoon.ui").nav_file(9)<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>% :source %<cr>
nnoremap <leader><cr> :so ~/.config/nvim/init.vim
nnoremap <leader>h :HopWord<cr>
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>x :silent !chmod +x %<CR>

command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:user_emmet_leader_key=','
