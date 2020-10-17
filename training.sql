--- Курс по SQL ---

-- 1. создание таблицы
CREATE TABLE book(book_id INT PRIMARY KEY AUTO_INCREMENT, title VARCHAR(50), author VARCHAR(30), price DECIMAL(8, 2), amount INT);

-- 2. вставка записи в таблицу
insert into book(title, author, price, amount) values('Мастер и Маргарита', 'Булгаков М.А.', 670.99, 3);
/*
Query result:
+---------+--------------------+---------------+--------+--------+
| book_id | title              | author        | price  | amount |
+---------+--------------------+---------------+--------+--------+
| 1       | Мастер и Маргарита | Булгаков М.А. | 670.99 | 3      |
+---------+--------------------+---------------+--------+--------+
Affected rows: 1
*/

-- 3. выборка всех данных из таблицы
select * from book;
/*
Query result:
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 2      |
| 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
+---------+-----------------------+------------------+--------+--------+
Affected rows: 5
*/

select title, amount, amount * 1.65 as pack from book;

---
SELECT title, amount, price, 
       round(IF(amount<4, price*0.5, IF(amount<11, price*0.7, price*0.9)),2) AS sale
FROM book;

---
select author, title, round(if (author='Булгаков М.А.', price * 1.1, if (author='Есенин С.А.', price * 1.05, price)), 2) as new_price 
from book;

---
select author, title, price from book where amount < 10;

---
select title, author, price, amount 
from book
where (price < 500 or price > 600) and price * amount >= 5000;

---
select title, author
from book
where (price between 540.50 and 800) and amount in(2, 3, 5, 7);

---
select title, author
from book
where (title like '_% _% _%') and author like '%с%';

---
select author, title
from book
where amount between 2 and 14
order by author desc, title asc;

---
select distinct amount from book;
Query result:
+--------+
| amount |
+--------+
| 3      |
| 5      |
| 10     |
| 15     |
+--------+
Affected rows: 4

---
