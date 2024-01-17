(defun load-program (name)
  (interactive "sProgram Name (in user-emacs-directory/users/programs/): ")
  (load-file (expand-file-name (concat user-emacs-directory "user/programs/" name))))

(load-program "hello.el")
(load-program "utils.el")


(provide 'modes)
