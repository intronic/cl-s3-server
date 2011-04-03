
(in-package :s3-server)

(defun get-host-name ()
  "Portable way to get the host name"
  #+sbcl (machine-instance)
  #+clisp (let ((s (machine-instance))) (subseq s 0 (position #\Space s)))
  #-(or sbcl clisp) (error "get-host-name not implemented"))

(defun path-rel-to-install (&optional subdir name)
  "Make a directory or file path relative to the package directory"
  (merge-pathnames (make-pathname
		    :name name
		    :directory (list :relative subdir))
		   (asdf-system-directory :s3-server)))

