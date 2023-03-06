module DigitSummer (main) where

sumDigits :: Integer -> Integer
sumDigits in_
    | in_ <= 9 = in_
    | otherwise = (in_ `mod` 10) + sumDigits (in_ `div` 10)

main :: IO ()
main = print $ sumDigits 999666
