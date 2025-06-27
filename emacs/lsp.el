
(use-package lsp-mode :commands lsp)

;; C/C++ meson configuration
;; https://github.com/kanogame/ctemplate
(use-package ccls
  :ensure t
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp))))
(setq ccls-sem-highlight-method 'font-lock)
(setq ccls-initialization-options '(:compilationDatabaseDirectory "build/"))
