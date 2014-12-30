(ns word-count.core
  (:require [clojure.string
             :refer [replace split lower-case]]))

(defn word-count
  [text]
  (-> text
      lower-case
      (replace #"\W" " ")
      (split #"\s+")
      frequencies))
