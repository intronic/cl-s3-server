
(in-package :cl-user)

(defpackage :s3-server
  (:use :cl 
	:hunchentoot
	:cl-who
        :f-underscore 
	:anaphora)
  (:nicknames :s3s)
  (:import-from :metatilities #:compose)
  (:documentation
   "Server implementing the S3 API."))

(in-package :s3-server)

(defparameter *s3-prefix* "/data/")

(setf *message-log-pathname* "/tmp/message-log")
(setf *access-log-pathname* "/tmp/access-log")

(defvar *acceptor* (make-instance 'acceptor :port 8080))
(defvar *s3-server* (start  *acceptor*))

