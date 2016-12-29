module ReverseCompliment
    (reverseCompliment) 
    where

reverseCompliment :: String -> String
reverseCompliment ls =
    reverse (map (\l -> 
        case l of 
        'A' -> 'T'
        'T' -> 'A'
        'C' -> 'G'
        'G' -> 'C'
        _   -> l) ls)