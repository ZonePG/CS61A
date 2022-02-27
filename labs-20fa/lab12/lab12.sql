.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color = "blue" and pet = "dog";

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color = "blue" and pet = "dog";


CREATE TABLE smallest_int AS
  SELECT time, smallest FROM students WHERE smallest > 2 ORDER BY smallest LIMIT 20;


CREATE TABLE matchmaker AS
  SELECT stu1.pet, stu1.song, stu1.color, stu2.color
    FROM students AS stu1, students AS stu2
      WHERE stu1.pet = stu2.pet and stu1.song = stu2.song and stu1.time < stu2.time;


CREATE TABLE sevens AS
  SELECT stu.seven
    FROM students AS stu, numbers as num
      WHERE stu.number = 7 and num.'7' = 'True' and stu.time = num.time;
