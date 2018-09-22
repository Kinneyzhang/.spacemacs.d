;; 开启行号显示
(add-hook 'prog-mode-hook 'display-line-numbers-mode);显示行号

;; 定义快捷键
(global-set-key (kbd "M-s o") 'occur-dwim)

(defun zilongshanren/open-file-with-projectile-or-counsel-git ()
  (interactive)
  (if (zilongshanren/vcs-project-root)
      (counsel-git)
    (if (projectile-project-p)
	      (projectile-find-file)
      (ido-find-file))))

;;防止页面滚动时跳动
;;scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动
;;scroll-step 1 设置为每次翻滚一行，可以使页面更连续
(setq scroll-step 1 scroll-margin 3 scroll-conservatively 10000)

;;----------------------------------------------------------------------
;;;orgmode 配置
(setq org-src-fontify-natively t)
(setq org-agenda-files '("~/org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
	       "* TODO [#B] %?\n  %i\n"
	       :empty-lines 1)
	      ("j" "Journal" entry (file+datetree "~/org/journal.org")
	       "* %?\nEntered on %U\n %i\n")

        ))

;;f1 打开init.el配置文件
(defun open-my-gtd-file()
  (interactive)
  (find-file "~/org/gtd.org"))
(global-set-key (kbd "C-c g") 'open-my-gtd-file)
;;----------------------------------------------------------------------
;; use aspell as ispell backend
(setq-default ispell-program-name "aspell")
;; use American English as ispell default dictionary
(ispell-change-dictionary "american" t)

;;避免每一级目录都产生一个buffer
(put 'dired-find-alternate-file 'disabled nil)

;;横向分割窗口
;;(setq split-height-threshold nil)
;;(setq split-width-threshold 0)
