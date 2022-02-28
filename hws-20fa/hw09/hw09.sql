CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size FROM dogs, sizes WHERE height > min and height <= max;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT dogs1.name FROM dogs as dogs1, dogs as dogs2, parents as parents1
    WHERE dogs1.name = parents1.child
      and parents1.parent = dogs2.name ORDER BY dogs2.height DESC;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT parents1.child as sib1, parents2.child as sib2
    FROM parents as parents1, parents as parents2
      WHERE parents1.parent = parents2.parent and parents1.child < parents2.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || sib1 || " plus " || sib2 || " have the same size: " || size
    FROM siblings, dogs as dogs1, dogs as dogs2, sizes
      WHERE sib1 = dogs1.name and sib2 = dogs2.name and dogs1.height > min and dogs1.height <= max and dogs2.height > min and dogs2.height <= max;

