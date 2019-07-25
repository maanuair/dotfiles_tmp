;; Appearance
;;;;;;;;;;;;;;

;; A customized visible bell
(defun my-terminal-visible-bell ()
  "A friendlier visual bell effect."
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil 'invert-face 'mode-line))

;; Despite the theme, override some faces settings
(set-face-attribute 'show-paren-match-expression nil :background "selectedContentBackgroundColor")

;; My preferred set up
(setq
  display-time-24hr-format t            ;; Time in 24h format
  doom-modeline-enable-word-count t     ;; Add a word count selection-info modeline segment.
  doom-modeline-major-mode-color-icon t ;; Display color icons for `major-mode'. It respects `all-the-icons-color-icons'.
  doom-modeline-minor-modes t           ;; Whether display minor modes or not. Non-nil to display in mode-line.
  echo-keystrokes 0.5                   ;; Show keystrokes right away
  font-lock-maximum-decoration t        ;; Use maximum decoration
  frame-title-format                    ;; Sets the frame title
  (
    list
    '(buffer-file-name "%f" (dired-directory dired-directory "%b"))
    " (" user-login-name "@" system-name  ")"
    )
  inhibit-startup-screen t                     ;; Remove start-up screen
  initial-scratch-message nil                  ;; Remove scratch message
  ring-bell-function 'my-terminal-visible-bell ;; Plug my customized visible bell
  sentence-end-double-space nil                ;; Sentences end with a single space
  show-paren-delay 0                           ;; Highlight parenthesis without delay
  show-paren-style 'expression                 ;; Highlight the matched expression
  visible-bell t                               ;; Use visible bell
  )
(column-number-mode 1)         ;; Display column number
(doom-modeline-mode 1)         ;; Use doom modeline
(global-hl-line-mode 1)        ;; Highlight current line
(global-font-lock-mode 1)      ;; Toggle font Lock mode in all buffers
(load-theme 'solarized-dark t) ;; Use solarized theme
(recentf-mode 1)               ;; Use recent files
(show-paren-mode 1)            ;; Visually match parentheses
(size-indication-mode 0)       ;; Do not show size of buffer
(toggle-indicate-empty-lines)  ;; Show empty lines
(tool-bar-mode 0)              ;; Remove toolbar
(toggle-scroll-bar 0)          ;; Remove scrollbar
(transient-mark-mode 1)        ;; Highlight active region

;; UI Behaviours
;;;;;;;;;;;;;;;;

;; Auto reformat on save
;; (require 'my-functions)
;; (add-hook 'before-save-hook 'reformat)
;; => Disabled, since cumbersome in some cases. Use [f5] shortcut instead :)

(setq
  apropos-do-all t             ;; More extensive search in apropos
  delete-by-moving-to-trash t  ;; Move to OS' trash when deleting stuff
  initial-major-mode 'org-mode ;; Org-mode by default
  vc-follow-symlinks t         ;; VC follows the link and visits the real file
  )
(delete-selection-mode 1)     ;; Delete text when typing over selection.
(editorconfig-mode 1)         ;; Use editor config
(ido-mode t)                  ;; Use ido
(save-place-mode 1)           ;; Save point position between sessions

;; Enable back the commands considered confusing to upper/lower case region
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

;; Global custom keyboard shortcuts
(global-set-key [(meta g)] 'goto-line)
(global-set-key (quote [f5]) 'reformat)
(global-set-key (quote [f12]) 'auto-revert-tail-mode)
(global-set-key (kbd "C-x g") 'magit-status)

;; Some modes settings
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start emmet on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; And on css modes as well

;; UI tweaks on macOS
;;;;;;;;;;;;;;;;;;;;;
(when (is-mac)
  (setq
    trash-directory "~/.Trash/"      ;; Trash folder on OSX is ~/.Trash/)
    mac-right-option-modifier  'none ;; Make the right option (Alt) key native
    )
  ;; Despite the theme, stick to my preferred fonts
  (add-to-list 'default-frame-alist '(font . "Cousine for Powerline-14"))
  (set-face-attribute 'default t :font "Cousine for Powerline-14")
  )

;; UI tweak on Windows
;;;;;;;;;;;;;;;;;;;;;;
(when (is-win)
  ;; Despite the theme, stick to my preferred fonts
  (add-to-list 'default-frame-alist '(font . "Inconsolata-12"))
  (set-face-attribute 'default t :font "Inconsolata-12")
  )

(provide 'my-ui)
