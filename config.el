;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Murtuz"
      user-mail-address "mrtuz@protonmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;; personal config
;; hooks
;; vars
(setq projectile-project-search-path '("~/code/"))
(setq org-todo-keywords
      '((sequence "TODO(t)" "INPROGRESS(I)" "WAITING(w)" | "DONE(d)" "CANCELLED(c)" )))
(setq org-todo-keyword-faces
      '(("TODO" :foreground "#7c7c75" :weight normal :underline t)
        ("WAITING" :forground "#9f7ef3" :weight normal :underline
         t)
        ("INPROGRESS" :forground "#0098dd" :weight normal :underline t)
        ("DONE" :forground "#50a14f" :weight normal :underline t)
        ("CANCELLED" :forground "#ff6480" :weight normal :underline t)))
(setq org-roam-directory "~/org/roamwiki")

;; mappings
(map! :leader
      :desc "neo-tree"
      "e" #'neotree-toggle)
(setenv "NODE_PATH" "~/node_modules")
;;packages
;;nov.el for epub support

(map!  :nv  "[k"    #'drag-stuff-up
      :nv  "[j"    #'drag-stuff-down
      :nv  "[l"    #'drag-stuff-right
      :nv  "[h"    #'drag-stuff-left
)

(setq doom-themes-treemacs-theme "doom-colors")

;;(after! lsp-python-ms
;;  (setq lsp-python-ms-executable (executable-find "python-language-server"))
;;  (set-lsp-priority! 'mspyls 1))
;;
;;(use-package lsp-jedi
;;  :ensure t
;;  :config
;;  (with-eval-after-load "lsp-mode"
;;    (add-to-list 'lsp-disabled-clients 'pyls)
;;    (add-to-list 'lsp-disabled-clients 'mspyls)
;;    (add-to-list 'lsp-enabled-clients 'jedi)
;;    (add-to-list 'company-backends 'company-jedi)))


;; Pomodoro Configs
(setq org-pomodoro-short-break-length 10)
(setq org-pomodoro-long-break-length 30)

(setq projectile-enable-caching t)
(setq projectile-indexing-method 'native)


;; transparency config
;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
 ;;(set-frame-parameter (selected-frame) 'alpha <both>)
 (set-frame-parameter (selected-frame) 'alpha '(85 . 50))
 (add-to-list 'default-frame-alist '(alpha . (85 . 50)))

(defun toggle-transparency ()
   (interactive)
   (let ((alpha (frame-parameter nil 'alpha)))
     (set-frame-parameter
      nil 'alpha
      (if (eql (cond ((numberp alpha) alpha)
                     ((numberp (cdr alpha)) (cdr alpha))
                     ;; Also handle undocumented (<active> <inactive>) form.
                     ((numberp (cadr alpha)) (cadr alpha)))
               100)
          '(85 . 80) '(100 . 100)))))
 (global-set-key (kbd "C-c t") 'toggle-transparency)


 (defun transparency (value)
   "Sets the transparency of the frame window. 0=transparent/100=opaque"
   (interactive "nTransparency Value 0 - 100 opaque:")
   (set-frame-parameter (selected-frame) 'alpha value))

; toggle paragraph direction
(defun toggle-paragraph-direction ()
  (interactive)
  (if (equal bidi-paragraph-direction 'left-to-right)
    (setq bidi-paragraph-direction 'right-to-left)
    (setq bidi-paragraph-direction 'left-to-right)
    )
    )
(global-set-key (kbd "C-c b") 'toggle-paragraph-direction)
