----------------------------------------------------------------------------------------------------

--Name:-Mohammed Shaad Matchewala
--student number:-21065793

------------------------------------------Brief Algorithm--------------------------------------------
--The program uses Breadth-First Search to identify the connected components.
--1.] The list of lists provided by the user was  converted in [((row, column), value)] format
--2.] Taking values from ((row,column),value) List, each value was compared to neighboring desired values,
-- which was either 1 or 0 depending on the value sent by the user, using up, down, left, and right functions
-- recursively until each method returns ((-1,-1),-1) value ,which represented unimplemented value.
--3.] A recurrent set of index and data was generated, hence the duplicate index and values were removed.
--4.] Now from the list of connected elements which were generated, the algorithm will take each element
-- and try to find out as many elements as possible for each case(each index).
--5.] From the lists generated in step 4, select the list with the maximum element.
--6.] The indexing function takes the list as input and a value and provides the largest component of that particular value,
-- when called through the indexlcc method, For Example, indexlcc (indexing l) 1
--  where the l is a custom List of List and 1 is the value required to generate the island
--7.]Finally to find the number of pixels in the largest connected component "nlcc l v" could be executed 
--  were l is the nested list  and v is the value.
----------------------------------------------Program--------------------------------------------------
--source:-https://github.com/ofir1080/largest-connected-component-haskell

-- Check the neighboring values iv and v if both are equal AND the value asked by the user and are equal
-- then return the index and its corresponding value else ((-1,-1),-1)
neighbour :: Integer -> ((Int, Int), Integer) -> Integer -> ((Int, Int), Integer)
neighbour v ((ix, iy), iv) value = if iv == v && v == value then ((ix, iy), iv) else ((-1, -1), -1)

-- if the first index (ix,iy) of the image is not equal to the value provided by the user (x,y)
-- then merge (ix,iy) into the list else keep the list as it is.
removeindex :: [((Int, Int), Integer)] -> ((Int, Int), Integer) -> [((Int, Int), Integer)]
removeindex [] _ = []
removeindex (((ix, iy), iv) : xs) ((x, y), v) = if ix /= x || iy /= y then ((ix, iy), iv) : removeindex xs ((x, y), v) else removeindex xs ((x, y), v)

-- the main function of locationOfIndex is providing the value at an index. For example,
-- if user enetered (0,0) then it should provide the value at that location ((0,0),0)
locationOfIndex :: [((Int, Int), Integer)] -> (Int, Int) -> ((Int, Int), Integer)
locationOfIndex [] _ = ((-1, -1), -1)
locationOfIndex (((x, y), v) : xs) (ix, iy) = if x == ix && y == iy then ((x, y), v) else locationOfIndex xs (ix, iy)

-- if the first and the second element of the index maches the index provided by the user then return the index
-- continue the recursion on the list untill find the index and it's value.

-- applyNeighbors macro implements findNeighbours newGrid function
-- newGrid macro implements removeindex function
-- findNeighbors function compared the value of the location with the neighboring value depending on which neighbor was sent
-- for example up, down, right , or left
-- index returned by the findNeighbors was then passed to applyNeighbors, which will then merge all the indexes
-- with the desired values together.
-- This will create several lists of connected elements for a value sent by the user.
findNeighbours :: [((Int, Int), Integer)] -> ((Int, Int), Integer) -> Integer -> [((Int, Int), Integer)]
findNeighbours _ (_, -1) _ = [] --if the value is -1. whatsoever the position is send it into emptylist(remove it).
findNeighbours indexes ((x, y), v) value =
  let current = ((x, y), v) --the current position
      up = locationOfIndex indexes (x, y + (-1)) -- identify the value above the current position
      down = locationOfIndex indexes (x, y + 1) -- identify the value below the current position
      left = locationOfIndex indexes (x + (-1), y) -- identify the value on the left of the current position
      right = locationOfIndex indexes (x + 1, y) -- identify the value on the right of the current position
      newGrid = removeindex indexes ((x, y), v)
      findNeighbors = neighbour v --checking for the neighbouring element
      applyNeighbors = findNeighbours newGrid
   in current : applyNeighbors (findNeighbors up value) value ++ applyNeighbors (findNeighbors down value) value ++ applyNeighbors (findNeighbors left value) value ++ applyNeighbors (findNeighbors right value) value

-- This function removes all the duplicate elements inside the list.
removeduplicates :: [((Int, Int), Integer)] -> [((Int, Int), Integer)]
removeduplicates l = foldl (\seen x -> if x `elem` seen then seen else seen ++ [x]) [] l

-- This function takes a list that contains a set of indexes and its values and from each set, this function would generate as many connected components as possible.
allneighbours :: [((Int, Int), Integer)] -> Integer -> [[((Int, Int), Integer)]]
allneighbours indexes value = map (\index -> removeduplicates (findNeighbours indexes index value)) indexes

-- Choose the list containing the maximum number of elements and provide the output.
maxelement :: [((Int, Int), Integer)] -> Integer -> [((Int, Int), Integer)]
maxelement indexes value = foldr (\maxelement current -> if length current > length maxelement then current else maxelement) [] (allneighbours indexes value)

--this will take a value and provide the largest component of that particular value.
--the output will be provided in terms of index and values ==> [((row, column), value)]
indexlcc :: [((Int, Int), Integer)] -> Integer -> [((Int, Int), Integer)]
indexlcc indexes value = map (\(i, v) -> (i, v)) (maxelement indexes value)

--Finally, this function will be called which will return the number of the largest connected components in the list of lists.
nlcc :: [[Integer]] -> Integer -> Int
nlcc indexes value = length (indexlcc (indexing indexes) value)

--This function aims to provide indexing to every element inside the nested list.
indexing :: [[Integer]] -> [((Int, Int), Integer)]
indexing l = [((x, y), l !! x !! y) | x <- [0 .. length l - 1], y <- [0 .. length (l !! x) - 1]]

l :: [[Integer]]
l =
  [ [0, 0, 0, 0, 1, 1],
    [1, 1, 1, 1, 1, 0],
    [1, 1, 0, 0, 0, 0],
    [1, 1, 0, 0, 1, 1],
    [1, 1, 1, 1, 1, 0]
  ]

--[[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1]]