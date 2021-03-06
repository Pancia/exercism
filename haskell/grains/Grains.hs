module Grains(square, total) where

square :: Int -> Integer
square n = (2^) $ n - 1

total :: Integer
total = foldl1 (+) $ map square [1..64]
