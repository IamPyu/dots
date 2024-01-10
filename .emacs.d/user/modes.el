(defun load-program (name)
  (load-file (expand-file-name (concat "~/.emacs.d/user/programs/" name))))

(load-program "hello.el")

(provide 'modes)
