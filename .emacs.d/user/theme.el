(tool-bar-mode -1)
(menu-bar-mode -1)
(when (display-graphic-p)
  (scroll-bar-mode -1))

(set-frame-font "Monaco-16" nil t)

(quick-use-package nordic-night-theme)
(quick-use-package gruber-darker-theme)
(quick-use-package mindre-theme)
(quick-use-package modus-themes)
(quick-use-package catppuccin-theme)

(load-theme 'gruber-darker t)

;; (use-package doom-modeline
;;   :straight t
;;   :ensure t
;;   :config
;;   (doom-modeline-mode))

(use-package dashboard
  :straight t
  :ensure t
  :config
  (setq dashboard-banner-logo-title "Welcome to Emacs, fellow Hacker!")
  (setq dashboard-center-content t)
  (dashboard-setup-startup-hook))

(use-package all-the-icons
  :straight t
  :ensure t
  :if (display-graphic-p))

(provide 'theme)
