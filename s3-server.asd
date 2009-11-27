
(in-package :cl-user)

(defpackage :s3-server-asd
  (:use :cl :asdf))

(in-package :s3-server-asd)

(defsystem s3-server
  :name "S3 Server"
  :version "0.0.1"
  :maintainer "Mike Pheasant <mike@pheasant.co.nz>"
  :author "Mike Pheasant <mike@pheasant.co.nz>"
  :licence ""
  :description "Hunchentoot web server implementing Amazon S3 API"
  :depends-on (:hunchentoot :cl-prevalence)
  :components ((:file "s3-server")
	       ;; (:file "utilities" 
	       ;; 	      :depends-on ("s3-server"))
	       ;; (:module conf
	       ;; 		:components ((:file "stores"))
	       ;; 		:depends-on ("s3-server" "utilities"))
	       (:module src
	       		:components ((:file "webdav-util")
				     (:file "handlers"
					    :depends-on ("webdav-util")))
	       		:depends-on ("s3-server"))))
	       		;; :depends-on ("s3-server" conf))))
