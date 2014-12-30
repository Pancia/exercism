(ns rna-transcription.core)

(defn to-rna
  [dna]
  (let [dna->rna {\G \C
                  \C \G
                  \T \A
                  \A \U}
        is-dna-nucleotide? (into #{} (keys dna->rna))
        assert-is-dna #(do (assert (is-dna-nucleotide? %)) %)]
    (apply str
           (map (comp
                  dna->rna
                  assert-is-dna)
                dna))))
