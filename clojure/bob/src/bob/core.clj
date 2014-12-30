(ns bob.core)

(defn is-empty?
  [query]
  (re-matches #"\s*" query))

(defn is-question?
  [query]
  (letfn [(lower-or-number? [q]
            (re-seq #"[a-z]|[0-9]" q))]
    (and
      (lower-or-number? query)
      (= \? (last query)))))

(defn is-shouting?
  [query]
  (letfn [(no-lower-case? [q]
            (not (re-seq #"[a-z]" q)))
          (has-upper-case? [q]
            (re-find #"[A-Z]" q))]
    (and
      (no-lower-case? query)
      (has-upper-case? query))))

(defn response-for
  [query]
  (cond
    (is-empty? query)
    "Fine. Be that way!"

    (is-question? query)
    "Sure."

    (is-shouting? query)
    "Whoa, chill out!"

    :else
    "Whatever."))
