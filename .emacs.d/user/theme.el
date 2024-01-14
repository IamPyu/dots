;; This script changes the look and feel of GNU Emacs.
;; I want it to look as good as possible while still looking minimal.
;; There are plenty of themes installed below, choose whatever suites you.

(tool-bar-mode -1)
(menu-bar-mode -1)
(when (display-graphic-p)
  (scroll-bar-mode -1))

(set-frame-name "GNU Emacs")
(set-frame-font "Courier New-14" nil t) ;; Do not question why I use such a font for programming!

(quick-use-package gruber-darker-theme)
(quick-use-package spacemacs-theme)
(quick-use-package modus-themes)
(quick-use-package monokai-theme)
(quick-use-package zenburn-theme)
(quick-use-package gruvbox-theme)
(quick-use-package color-theme-sanityinc-tomorrow)
(quick-use-package vscode-dark-plus-theme)
(quick-use-package tao-theme)
(quick-use-package habamax-theme)

(load-theme 'spacemacs-dark t)

(quick-use-package nerd-icons)

(use-package treemacs-nerd-icons
  :straight t
  :ensure t
  :config
  (treemacs-load-theme "nerd-icons"))

(use-package nerd-icons-dired
  :straight t
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package spaceline
  :straight t
  :ensure t
  :config
  (require 'spaceline-config)
  (spaceline-emacs-theme))


(use-package dashboard
  :straight t
  :ensure t
  :config
  (setq dashboard-banner-logo-title "Welcome to Emacs!")
  (setq dashboard-footer-messages '("functions functions, ah yes! functions!"
				    "vim sucks hahahahhaha"
				    "https://bfdi.tv WATCH IT NOW."
				    "hi mom"
				    (hello-msg)))
  (setq dashboard-center-content nil)
  (dashboard-setup-startup-hook))

(use-package nerd-icons-completion
  :straight t
  :ensure t
  :config
  (nerd-icons-completion-mode))

(provide 'theme)
