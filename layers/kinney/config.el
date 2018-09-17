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

;;orgmode 配置
(setq org-src-fontify-natively t)
(setq org-agenda-files '("~/org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
	       "* TODO [#B] %?\n  %i\n"
	       :empty-lines 1)
	      ("j" "Journal" entry (file+datetree "~/org/journal.org")
	       "* %?\nEntered on %U\n %i\n")
	      ))