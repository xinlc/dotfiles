;; 视觉层配置


;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 关闭启动帮助画面
(setq inhibit-splash-screen t)

;; 更改光标的样式
(setq-default cursor-type 'bar)

;; 打开emacs 最大化
(setq  initial-frame-alist (quote ((fullscreen . maximized))))

;; 高亮当前行，当文本内容很多时可以很容易找到光标的位置。
;; (global-hl-line-mode 1)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 160)


(provide 'init-ui)