;; org roam setup
(setq org-startup-indented t)
(setq org-src-preserve-indentation t)
(setq org-roam-directory (file-truename "~/docs/roam"))
(org-roam-db-autosync-mode)
(setq org-directory "~/docs/roam")
(setq org-screenshots "~/docs/roam/media")


; GTD
(setq org-agenda-files (list "inbox.org" "agenda.org"))
(setq org-capture-templates
      `(("i" "Inbox" entry  (file "inbox.org")
        ,(concat "* TODO %?\n"
                 "/Entered on/ %U"))
	 ("m" "Meeting" entry (file+headline "agenda.org" "Future")
	  ,(concat "* %? :meeting:\n"
         "<%<%Y-%m-%d %a %H:00>>"))))
;; to open in full buffer (not mini) 
(add-hook 'org-capture-mode-hook 'delete-other-windows)

;; roam
(global-set-key (kbd "C-c n f") 'org-roam-node-find)
(global-set-key (kbd "C-c n i") 'org-roam-node-insert)
(global-set-key (kbd "C-c n d") 'org-roam-dailies-capture-today)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-o") 'org-open-at-point)       

(defun save-screenshot ()
  "take a screenshot and save it to specified destination"
  (interactive)
  (let ((screenshot-buffer (get-buffer-create "org-screenshot")))
    (with-current-buffer screenshot-buffer
      ;; cleaning the buffer
      (erase-buffer)
      ;; disabling multibyte to not mess with binary
      (set-buffer-multibyte nil)
      ;; grim command
      (let* ((exit-code (call-process
			"grim"
			nil
			screenshot-buffer
			nil
			"-t"
			"jpeg"
			"-q"
			"80"
			"-g"
			(string-join (process-lines "slurp") " ")
			"-")))
	(if (eq exit-code 0)
	    ;; a special let that allows to reference previous definitions
	    (let* (
		   ;; asking for filename
		   (filename (read-from-minibuffer "filename (拡張子なし): "))
		   (filepath (concat org-screenshots "/" filename ".jpg")))
	      ;; saving
	      (write-region (point-min) (point-max) filepath nil 'silent)
	      (message "file was saved to: %s" filepath)
	      filename)
	  (message "grim er: %d" exit-code)
	  "")))))

(defun org-screenshot ()
  "save screenshot and insert org link to it"
  (interactive)
  (let ((filename (save-screenshot)))
    (insert (concat "[[./media/" filename ".jpg]]")))
  (org-display-inline-images))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
