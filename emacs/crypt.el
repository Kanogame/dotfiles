;;gocryptfs
(defun unlock-daily ()
  (interactive)
  (let ((password (read-passwd "folder password")))
    (with-temp-buffer (insert password)
		      (let ((exit-code (call-process-region
					(point-min)(point-max)
					"gocryptfs"
					nil
					"mount"
					nil
					"/home/kano/docs/roam/sec" "/home/kano/docs/roam/daily")))
			(if (eq exit-code 0)
			    (message "mounted")
			  (message "error" exit-code))))))
