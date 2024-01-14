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

(defmacro quick-use-package (name)
  "An alias to (use-package :straight t :ensure t)"
  `(use-package ,name :straight t :ensure t))

(quick-use-package treemacs)
(quick-use-package counsel)

(use-package dired-sidebar
  :straight t
  :ensure t
  :config
  (defalias 'filetree 'dired-sidebar-toggle-sidebar))

(use-package company
  :straight t
  :ensure t
  :init
  (global-company-mode 1))

(use-package ivy
  :straight t
  :ensure t
  :config
  (ivy-mode 1)
  (use-package ivy-rich
    :straight t
    :ensure t
    :config
    (ivy-rich-mode 1)))

(use-package switch-window
  :straight t
  :ensure t
  :config
  (global-set-key (kbd "C-x o") 'switch-window))

(use-package dirvish
  :straight t
  :ensure t
  :config
  (dirvish-override-dired-mode))

(use-package magit
  :straight t
  :ensure t)

(use-package yasnippet
  :straight t
  :ensure t
  :config
  (yas-reload-all)
  (yas-global-mode))

(use-package helm
  :straight t
  :ensure t
  :config
  (helm-mode))

(provide 'plugs)
