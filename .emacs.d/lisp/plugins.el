;; Boostrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(cl-defmacro package! (name &body body)
  "Install package NAME and evaluate BODY for configuration"
  `(use-package ,name
     :ensure t
     :straight t
     :config
     (progn ,@body)))

;; Core packages
(package! helm (helm-mode))
(package! ivy (ivy-mode))
(package! company (global-company-mode))
(package! treemacs)
(package! magit)

(package! dired-sidebar
	  (defalias 'filetree 'dired-sidebar-toggle-sidebar))

(package! yasnippet
	  (yas-reload-all)
	  (yas-global-mode))

(package! tree-sitter
	  (package! tree-sitter-langs)
	  (global-tree-sitter-mode))

;; Programming Language
(package! rust-mode)
(package! haskell-mode)
(package! nix-mode)
(package! lua-mode)
(package! clojure-mode)
(package! markdown-mode)

(package! cider)

(package! eglot)
(defmacro lsp! (mode)
  `(add-hook ,mode 'eglot-ensure))

(lsp! 'c-mode)
(lsp! 'rust-mode)

(provide 'plugins)
