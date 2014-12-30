module DNA where

import Data.Maybe

toRNA :: [Char] -> [Char]
toRNA = fromJust . sequence . map convertDna
        where convertDna :: Char -> Maybe Char
              convertDna = (flip lookup) dnaToRnaTable

              dnaToRnaTable :: [(Char, Char)]
              dnaToRnaTable = zip ['G', 'C', 'T', 'A']
                                  ['C', 'G', 'A', 'U']
