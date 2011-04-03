
(in-package :s3-server)

;;; Multiple stores may be defined. The last defined store will be the
;;; default.

;; (defparameter *host-mysql-store*   (rest (assoc (get-host-name) 
;; 		(list '("aqua" . ("localhost" "mjp_web" "root" ""))
;; 		      '("genome2.qfab.org" . ("localhost" "mjp_web" "root" "my5ql")))
;; 		:test #'string-equal)))

;;; If using mysql store, choose connection based on host
;; (defstore *mysql-store* :clsql *host-mysql-store*
;; 	  :database-type :mysql)


;;; define BDB Object store for data (too large to store in mem)
;; (defstore *data-store* :elephant 
;;   :spec `(:BDB ,(namestring (merge-pathnames (make-pathname :directory '(:relative "data"))
;; 					     (asdf-system-directory :mjp-web)))))


;;; Store user data in prevalence (fast in-memory store backed up to disk)
;; (defstore *user-store* :prevalence (path-rel-to-install "data"))

;;; Default store:
;;; Store metadata in prevalence (fast in-memory store backed up to disk as xml or sexps)
;;; Memory should be sufficient; ucsc metadata for hg18 totals ~4Mb in 2009
;; (defstore *metadata-store* :prevalence (path-rel-to-install "data"))
