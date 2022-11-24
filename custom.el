(require 'doom-themes)
(require 'web-mode)
(require 'yaml-mode)
(require 'json-mode)
(require 'graphql-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company-jedi lsp-jedi sqlite org-roam latex-math-preview esqlite emacsql-sqlite3 emacsql-sqlite-module)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)

(with-eval-after-load 'doom-themes
  (doom-themes-treemacs-config))

