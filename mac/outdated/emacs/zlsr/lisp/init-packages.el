;; 插件管理
;; =======配置 MELPA =========

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(
		("melpa" . "http://elpa.emacs-china.org/melpa/")
		;;("gnu"   . "http://elpa.emacs-china.org/gnu/")
		)))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
		      ;; --- Auto-completion ---
		      company
		      ;; --- Better Editor ---
		      hungry-delete       ;; 删除空格
		      swiper              ;; 增强查找
		      counsel             ;; 增强命令
		      smartparens         ;; 括号自动补全
		      ;; --- Major Mode ---
		      js2-mode              ;; js mode
		      web-mode              ;; html mode
		      ;; --- Minor Mode ---
		      nodejs-repl           ;; nodejs
		      js2-refactor          ;; js2-refactor 是一个用于重构 JavaScript 的插件

		      ;; --- Themes ---
		      monokai-theme
		      ;; solarized-theme

		      ;; --- Other ---
		      popwin                ;; 自动跳转到小窗口
		      exec-path-from-shell  ;; 可以找到shell
		      reveal-in-osx-finder  ;; 在finder打开文件（mac os）
		      expand-region         ;; 选中增强
		      iedit                 ;; 多行编辑
		      helm-ag               ;; 快速搜索
		      flycheck
		      yasnippet             ;; 代码块补全的插件
		      auto-yasnippet        ;; 也是一个自动补全的插件

		      ;; --- vim ---
		      evil                ;; vim
		      evil-leader         ;; 配置leader
		      window-numbering    ;; 使用 Leader Key 与数字键的组合来在多个窗口之间进行跳转
		      evil-surround       ;; 增强区域修改
		      evil-nerd-commenter ;; 快速添加与取消注释
		      which-key           ;; 查找分组快捷键
		      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;; =============插件配置============

;; 开启全局 Company 补全
(global-company-mode 1)

;; 每次打开编辑器时加载主题
(load-theme 'monokai 1)

;; Emacs 提供的默认 JavaScript Major Mode 并不是非常好用。
;; 所以我们可以将默认的模式 替换成 js2-mode 一个比默认模式好用的 Major Mode。
;; 我们可以通过 MELPA 来下载它，然 后用下面的代码将其启用。
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

;; 激活evil
(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)


;; 激活 evil-leader
(global-evil-leader-mode)
;; 配置leader
(evil-leader/set-key
  "ps" 'helm-do-ag-project-root
	"pf" 'counsel-git
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":"  'counsel-M-x
  "wM" 'delete-other-windows
  )

;; 激活evil-surround
(require 'evil-surround)
(global-evil-surround-mode)

;; 激活Evil-nerd-commenter 快速添加与取消注释
(evilnc-default-hotkeys)
;; 这里我们选择使用 ,/ 作为快捷键。
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

;; 激活 window-numbering
(window-numbering-mode 1)

;; 激活 which-key
(which-key-mode 1)

;; 激活 hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; 自动匹配括号， 引号
(require 'smartparens-config)
(smartparens-global-mode t)

;; popwin
(require 'popwin)
(popwin-mode t)


;; yasnippet 在所有的编程语言的模式中激活代码块补全
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;; js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")


;; js文件启用flycheck
(add-hook 'js2-mode-hook 'flycheck-mode)


;; 启用 dired-x 可以让每一次进入 Dired 模式时，使用新的快捷键 C-x C-j 就可以进 入当前文件夹的所在的路径。
(require 'dired-x)

;; To load at the start up
;; (require 'reveal-in-osx-finder)

;; 设置web-mode 初始缩进
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)


;; 下面的函数可以用于在两个空格和四个空格之间进行切换，
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

(provide 'init-packages)

