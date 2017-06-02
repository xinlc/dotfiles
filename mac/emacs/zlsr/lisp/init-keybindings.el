;; 快捷键绑定


;; 配置 swiper 和 counsel
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
;;(global-set-key (kbd "C-c  f") 'counsel-git)

;; 打开init.el
(global-set-key (kbd "<f2>") 'open-my-init-file)

;; 打开最近打开的文件列表
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 打开定义
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


(global-set-key (kbd "C-c a") 'org-agenda)

;; 修改 mark set 快捷键为 C-return
(define-key global-map [C-return] 'set-mark-command)

;; 向后移除一个单词
(global-set-key (kbd "C-w") 'backward-kill-word)

;; indent-region 代码缩进整个buffer
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; Hippie 补全
(global-set-key (kbd "s-/") 'hippie-expand)

;; 文件在finder中打开
(global-set-key (kbd "C-c z") 'reveal-in-osx-finder)

;; 两个空格和四个空格之间进行切换，
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;; 配置 Occur Mode 使其默认搜索当前被选中的或者在光标下的字符串：
(global-set-key (kbd "M-s o") 'occur-dwim)

;; imenu 可以显示当前所有缓冲区的列表
(global-set-key (kbd "M-s i") 'counsel-imenu)

;; expand-region 方便选中区域
(global-set-key (kbd "C-=") 'er/expand-region)

 ;; iedit 多光标编辑
(global-set-key (kbd "M-s e") 'iedit-mode)

;; 延迟加载dire
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 修改company 选中快捷键
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; ag ,快速检索
;;(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;; auto-yasnippet 非常好用代码块补全插件
(global-set-key (kbd "H-w") #'aya-create)
(global-set-key (kbd "H-y") #'aya-expand)

(provide 'init-keybindings)
