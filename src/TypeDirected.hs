module TypeDirected (
  Nested,
  search,
  ex1,
  ex2
) where

import BruteForce (solve)
import Data.Function (on)
import Data.List (intersectBy)

data Nested
  = Leaf Int
  | Level [Nested]
  deriving (Eq)

type Example = (Nested, Nested)

search :: Example -> [(Nested -> Nested, String)]
search ex = case ex of
  (Level xs, Level ys) -> maps
   where
    -- assume that this situation can only result from map
    maps = zip (map nestFun fs) (map makeName ns)
    (fs, ns) = unzip validFuns
    makeName n = "map (" ++ n ++ ")"
    validFuns = foldr1 intersector nestFuns
    intersector = intersectBy ((==) `on` snd)
    nestFuns = zipWith (curry search) xs ys
    nestFun f (Level lst) = Level (map f lst)
    nestFun _ _ = Leaf 0

  (Level _, Leaf _) -> folds
   where
    -- at this point assume xs is a flat list
    folds = [] -- will implement later ...

  (Leaf x, Leaf y) -> zip nestFun funNames
   where
    -- base case: integer arithmetics from hw1
    (intFun, funNames) = unzip $ take 10 $ solve [(x, y)]
    nestFun = map wrap intFun
    wrap f (Leaf a) = Leaf (f a)
    wrap _ _ = Leaf 0
  (_, _) -> []


-- map ( map (+1) )
ex1 :: Example
ex1 =
  ( Level
      [ Level [Leaf 71, Leaf 75]
      , Level [Leaf 90, Leaf 87]
      ]
  , Level
      [ Level [Leaf 72, Leaf 76]
      , Level [Leaf 91, Leaf 88]
      ]
  )

-- map ( map (*2) )
ex2 :: Example
ex2 =
  ( Level
      [ Level [Leaf 71, Leaf 75]
      , Level [Leaf 90, Leaf 87]
      ]
  , Level
      [ Level [Leaf 142, Leaf 150]
      , Level [Leaf 180, Leaf 174]
      ]
  )
