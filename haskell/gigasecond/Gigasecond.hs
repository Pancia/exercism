module Gigasecond where

import Data.Time.Calendar

fromDay :: Day -> Day
fromDay = addDays (floor gigaday)
    where gigasecond = 10 ^ 9
          gigaday = gigasecond / 60 / 60 / 24
