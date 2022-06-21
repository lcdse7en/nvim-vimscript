" ----------------------
" ====== Plug - floaterm
" ----------------------
" let g:floaterm_keymap_toggle = '<F1>'
" 打开floaterm窗口
let g:floaterm_keymap_toggle = '<leader>ff'
" 下一个floaterm窗口
let g:floaterm_keymap_next = '<leader>fn'
" 上一个floaterm窗口
let g:floaterm_keymap_prev = '<leader>fp'
" 创建一个新的floaterm窗口
let g:floaterm_keymap_new = '<leader>fc'
" 跳转到第一个floaterm窗口
let g:floaterm_keymap_first = '<leader>fa'
" 跳转到最后一个floaterm窗口
let g:floaterm_keymap_last = '<leader>fe'
" 隐藏和显示完全可以使用<leader>ff来操作
" 隐藏floaterm
let g:floaterm_keymap_hide = '<leader>fh'
" 显示floaterm
let g:floaterm_keymap_show = '<leader>fs'
" 关闭floaterm当前窗口,并退出floaterm
let g:floaterm_keymap_kill = '<leader>fk'

" ------------------------------
" === Plug - floaterm
" ------------------------------
" floaterm 打开ranger
nmap <leader>fr :FloatermNew ranger<CR>
" floaterm 打开 fzf
nmap <leader>fz :FloatermNew fzf<CR>
