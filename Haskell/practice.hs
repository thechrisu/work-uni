{-# LANGUAGE ParallelListComp #-}
import Data.Char
import Test.QuickCheck

ret5 :: a -> Int
ret5 _ = 5

firstElem :: (Eq a) => [a] -> a -> Bool
firstElem [] _ = False
firstElem (x:xs) a = if x==a then True else False

max' :: (Ord a) => a -> a -> a
max' a b = if a>b then a else b

and' :: Bool -> Bool -> Bool
and' x y | x = y
        | otherwise = False

id' :: a -> a
id' x = x

caseTest :: [Char] -> Int
caseTest "IEP" = 0
caseTest [] = 1
caseTest (x:xs) = 2
--last case is never reached, thus omitted

applTwoFunctions :: (a -> b) -> (a -> c) -> a -> (b,c)
applTwoFunctions f g x = (f x,g x)

applAllFunctions :: [(a -> a)] -> a -> a
applAllFunctions fs x = foldr (\f acc -> f $ acc) x fs

length' :: [a] -> Int
length' xs = sum [1 | _ <- xs]

doubleAll :: (Num a) => [a] -> [a]
doubleAll xs = [2*x | x <- xs]

allFactors :: Int -> [Int]
allFactors x = [a | a <- [1..x], x `mod` a == 0]

removeAllLowerCase :: String -> String
removeAllLowerCase xs = [x | x <- xs, not (x `elem` ['a'..'z'])]

map' :: (a -> b) -> [a] -> [b]
map' f xs = [f x | x <- xs]

filter' :: (a -> Bool) -> [a] -> [a]
filter' p xs = [x | x <- xs, p x]

length'' :: [a] -> Int
length'' = foldr(\_ acc -> acc + 1) 0

doubleAll' :: (Num a) => [a] -> [a]
doubleAll' = map (*2)

--prop_doubleAll :: (Num a) => [a] -> Bool
--prop_doubleAll as = doubleAll as == doubleAll' as

getFactors :: Int -> [Int]
getFactors a = filter (\x -> a `mod` x == 0) [1..a]

map'' :: (a -> b) -> [a] -> [b]
map'' f = foldr(\x acc-> f x : acc) []

filter''' :: (a -> Bool) -> [a] -> [a]
filter''' _ [] = []
filter''' p (x:xs) = if p x then x:filter p xs else filter p xs

composeList :: [(a -> a)] -> a -> a
composeList f = \val -> foldr (\x acc -> x $ acc) val f

total :: (Integer -> Integer) -> (Integer -> Integer)
total f n = sum $ map f [0..n]

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = \a b -> f b a

--prop_f :: (a -> b -> c) -> Bool
--prop_f f = flip f == flip' f

--prop_l :: [a] -> Bool
--prop_l xs = length' xs == length xs

--map (+1) . filter (>(-1))
--filter (>0) . map (+1)

--prop_zip :: [(a,b)] -> Bool
--prop_zip xs = (uncurry zip $ unzip xs) == xs

--curry3 :: ((a, b, c) -> d) -> (a -> b -> c -> d)
--curry3 f = \a b c -> f (a,b,c)
--uncurry

uncurry3 :: (a -> b -> c -> d) -> ((a,b,c) -> d)
uncurry3 f = \(a,b,c) -> f a b c

curry'' ::  ((a,b) -> c) -> a -> b -> c
curry'' f = \a b -> f (a, b)

allEqual :: (Eq a) => (Int -> a) -> Int -> Bool
allEqual f n = all (== f 0) (map f [1..n])

foldl' :: (a -> b -> b) -> [a] -> b -> b
foldl' _ [] z = z
foldl' (op) (x:xs) z = foldl' (op) xs (op x z) 