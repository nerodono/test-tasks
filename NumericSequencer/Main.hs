module Main (main) where

sequenceGenerator :: IO [Integer]
sequenceGenerator = do
    line <- getLine
    let num = read line :: Integer

    if num == 0 then
        return []
    else
        fmap (num :) $ sequenceGenerator

sequencer :: [Integer] -> (Integer, Integer)
sequencer [] = undefined -- Map has at least single element
sequencer (h:t) = impl 1 h t
    where
        impl :: Integer -> Integer -> [Integer] -> (Integer, Integer)
        impl occurs greatest [] = (greatest, occurs)
        impl occurs greatest (h : t) =
            if h > greatest then
                impl 1 h t
            else
                impl (occurs + 1) greatest t

main :: IO ()
main = do
    putStrLn "Enter sequence items line by line:"
    seq <- sequenceGenerator
    let result = sequencer seq

    print result

