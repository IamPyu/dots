;; GNU Emacs Configuration
;; Created by seania

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq roswell-helper (expand-file-name "~/.roswell/helper.el"))

(when (file-exists-p custom-file)
  (load-file custom-file))

;; (when (file-exists-p roswell-helper)
;;   (load-file roswell-helper))

;; exec paths
(defun add-exec-path (p)
  (add-to-list 'exec-path (expand-file-name p)))

(add-exec-path "~/.cargo/bin")
(add-exec-path "~/.ghcup/bin")
(add-exec-path "~/.roswell/bin")
(add-exec-path "/run/current-system/sw/bin")
(add-exec-path "/opt/homebrew/bin")

(require 'plugins) ;; Plugins
(require 'options) ;; Themeing and options
