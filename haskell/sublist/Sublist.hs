module Sublist where

import Data.List

data Sublist = Sublist | Superlist | Equal | Unequal
             deriving (Show, Eq)

sublist :: (Eq a) => [a] -> [a] -> Sublist
sublist x y
        | x == y          = Equal
        | x `isInfixOf` y = Sublist
        | y `isInfixOf` x = Superlist
        | otherwise       = Unequal
