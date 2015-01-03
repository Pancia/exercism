module DNA where

import Control.Error.Util

type Nucleotide = Char
type Transcriber = (Nucleotide -> Either String Nucleotide)
type RNA = [Nucleotide]
type DNA = [Nucleotide]

dnaList = ['G', 'C', 'T', 'A']
rnaList = ['C', 'G', 'A', 'U']

toRNA :: DNA -> RNA
toRNA = either error id
      . transcribeWith dnaToRna

transcribeWith :: Transcriber -> [Nucleotide] -> Either String [Nucleotide]
transcribeWith = mapM

dnaToRna :: Transcriber
dnaToRna c = note ("Invalid DNA elem: " ++ show c)
           $ flip lookup dnaToRnaTable c
    where dnaToRnaTable = zip dnaList rnaList
