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

(quick-use-package neotree)
(use-package corfu
  :straight t
  :ensure t
  :init
  (setq corfu-auto t
	corfu-quit-no-match 'separator)
  (global-corfu-mode))

(use-package ivy
  :straight t
  :ensure t
  :config
  (ivy-mode))

(provide 'plugs)
