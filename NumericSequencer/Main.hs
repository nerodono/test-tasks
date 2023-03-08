module Main (main) where

-- Haskell lists are lazy, so receiving just list also works.
sequencer :: [Integer] -> (Integer, Int)
sequencer [] = undefined
sequencer (0:t) = undefined -- sequence has at least 1 element
sequencer (h:t) =
    sequencerImpl 0 0 h t
    where
        sequencerImpl :: Int -> Int -> Integer -> [Integer] -> (Integer, Int)
        sequencerImpl _ maxI' max' [] = (max', maxI')
        sequencerImpl curIdx maxI' max' (h':t')
            | h' == 0 = (max', maxI')
            | otherwise =
                if h' > max' then
                    continue nextIndex h' t'
                else
                    continue maxI' max' t'
            where nextIndex = curIdx + 1
                  continue = sequencerImpl nextIndex

main :: IO ()
main = do
    putStrLn "Enter numbers line by line:"
    seq <- sequencerGenerator []
    print $ sequencer seq

    where
        sequencerGenerator :: [Integer] -> IO [Integer]
        sequencerGenerator prepend = do
            line <- getLine
            let number = read line :: Integer
            if number == 0 then
                return prepend
            else
                sequencerGenerator (prepend ++ [number])

