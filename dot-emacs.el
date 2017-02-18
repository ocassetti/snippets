;; .emacs
(add-to-list 'load-path "~/emacs.d/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(cursor-type (quote box))
 '(diff-switches "-u")
 '(global-linum-mode t)
 '(linum-format (quote linum-highlight-current-line))
 '(show-paren-mode t))

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "dim gray"))))
 '(linum ((t (:inherit (shadow default) :background "light gray"))))
 '(linum-current-line ((t (:inherit linum :foreground "deep sky blue" :weight bold)))))

;;; Settings for line number 
(global-font-lock-mode 1)
(global-linum-mode 1)
(setq linum-format "%3d\u2502 ")
(load-library "linum-highligth-current-line-number")
(global-hl-line-mode 1)


;;; Settings for backups

(setq
   backup-by-copying t      
   backup-directory-alist
   '(("." . "~/.emacs-backups")) 
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)      
