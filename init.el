;; Bootstrap straight.el
(let ((bootstrap-file (concat user-emacs-directory "straight/repos/straight.el/bootstrap.el"))
      (bootstrap-version 3))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Put these variables elsewhere as they shouldn't be in version control (only added on first startup)
(setq custom-file "~/.emacs.d/custom.el")
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file)) ;; Touch file for first run
(load custom-file)

;;; Declare Dependencies

;; Docker
(straight-use-package 'dockerfile-mode)
(straight-use-package 'docker-compose-mode)

;; Haskell
(straight-use-package 'intero)

;; Git
(straight-use-package 'magit)

;; General
(straight-use-package 'rainbow-delimiters)
(straight-use-package 'exec-path-from-shell)

;; Markdown
(straight-use-package 'markdown-mode)

;; Yaml
(straight-use-package 'yaml-mode)

;; Color Theme
(straight-use-package 'color-theme-solarized)


;;; Set hooks

;; Theme
(add-hook 'after-init-hook (lambda () (load-theme 'solarized)))
(set-frame-parameter nil 'background-mode 'dark)

;; Intero
(add-hook 'haskell-mode-hook 'intero-mode)

;; Terminal Env -> Emacs Env
(add-hook 'after-init-hook (lambda () (exec-path-from-shell-initialize)))


;;; Custom Key Bindings

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
