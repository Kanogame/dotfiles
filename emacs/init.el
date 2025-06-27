

;; eval this file - M-x eval-buffer / M-x eval-region
(setq custom-file "/home/kano/.config/emacs/custom.el")

(load "/home/kano/.config/emacs/crypt.el")
(load "/home/kano/.config/emacs/orgutils.el")
(load "/home/kano/.config/emacs/lsp.el")

(require 'evil)
(evil-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(global-display-line-numbers-mode)


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(dracula))
 '(custom-safe-themes
   '("691b984aa0a71fa8ad706754573c256d4536a5827bb2ee453f6531a45f54b919" default))
 '(org-startup-truncated nil)
 '(package-selected-packages
   '(org-roam-ui lsp-mode ccls riscv-mode multiple-cursors org-roam evil emacsql-sqlite dracula-theme)))

;; ido
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode (quote both))

;; font
(set-fontset-font "fontset-default" 'han "Noto Sans Mono CJK JP")
(set-fontset-font "fontset-default" 'cjk-misc "Noto Sans Mono CJK JP")
(set-fontset-font "fontset-default" 'kana "Noto Sans Mono CJK JP")
(set-fontset-font "fontset-default" 'kanbun "Noto Sans Mono CJK JP")
(set-fontset-font "fontset-default" 'symbol "Noto Sans Mono CJK JP")

;; slaugher
(global-set-key (kbd "C-x c t") '(kill-buffer RET))
(global-set-key (kbd "C-x c s") 'kilal-matching-buffers)

;; other
(global-set-key (kbd "C-x c c") 'compile)

;; autosave 
(setq auto-save-default t)
(setq backup-directory-alist `(("~/.e_saved")))
;;; Indent and formatting
(setq-default left-fringe-width  4)
(setq-default right-fringe-width 4)

;; Do not show an arrow at the top/bottomin the fringe and empty lines
(setq-default indicate-buffer-boundaries nil)
(setq-default indicate-empty-lines nil)

;; tab
(setq-default indent-tabs-mode nil tab-width 4)
(setq-default tab-always-indent nil)

;; Continue wrapped lines at whitespace rather than breaking in the mid
;; dle of a word.
(setq-default word-wrap t)
