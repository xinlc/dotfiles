nmap j gj
nmap k gk

set clipboard=unnamed

" Go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
exmap back obcommand app:go-back
nmap <C-o> :back
exmap forward obcommand app:go-forward
nmap <C-i> :forward

exmap jumpToLink obcommand mrj-jump-to-link:activate-lightspeed-jump
nmap s :jumpToLink

unmap <Space>

exmap editTask obcommand obsidian-tasks-plugin:edit-task
nmap <Space>tt :editTask
exmap toggleDone obcommand obsidian-tasks-plugin:toggle-done
nmap <Space>td :toggleDone
