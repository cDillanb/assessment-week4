-- Artist table
INSERT INTO artist (name)
VALUES ('AJR'),
('Jon Bellion'),
('Mystery Skulls');

SELECT * FROM artist
ORDER BY name
LIMIT 5;


-- Employee table
SELECT first_name, last_name FROM employee
WHERE city = 'Calgary';

SELECT * FROM employee
WHERE reports_to = 2;

SELECT COUNT(*) FROM employee
WHERE city = 'Lethbridge';


-- Invoice table
SELECT COUNT(*) FROM invoice
WHERE billing_country = 'USA';

SELECT MAX(total) FROM invoice;

SELECT MIN(total) FROM invoice;

SELECT * FROM invoice_line
WHERE unit_price > 5;

SELECT COUNT(*) FROM invoice_line
WHERE unit_price < 5;

SELECT SUM(unit_price) FROM invoice_line;


-- JOIN queries (Various tables)
SELECT * FROM invoice
WHERE invoice_id IN (
    SELECT invoice_id
    FROM invoice_line
    WHERE unit_price > 0.99
);


SELECT i.invoice_date, c.first_name, 
	c.last_name, i.total
FROM invoice i
	JOIN customer c
  	    ON i.customer_id = c.customer_id;


SELECT c.first_name, c.last_name,
	e.first_name AS support_rep_first,
  e.last_name AS support_rep_last
FROM customer c
	JOIN employee e
  	    ON c.support_rep_id = e.employee_id
ORDER BY c.first_name;


SELECT al.title AS album_title,
	ar.name AS artist_name
FROM album al
	JOIN artist ar
  	    ON al.artist_id = ar.artist_id;


-- Extra credit

-- Artist table
SELECT * FROM artist
ORDER BY name DESC
LIMIT 10;

SELECT * FROM artist 
WHERE name LIKE 'Black%';

SELECT * FROM artist
WHERE name LIKE '%Black%';


-- Employee table
SELECT MAX(birth_date) FROM employee;

SELECT MIN(birth_date) FROM employee;


-- Invoice table
SELECT COUNT(*) FROM invoice
WHERE billing_state IN ('CA', 'TX', 'AZ');

SELECT AVG(total) FROM invoice;


-- More Join Queries
SELECT pt.track_id 
FROM playlist_track pt
    JOIN playlist p
  	    ON pt.playlist_id = p.playlist_id
WHERE p.name = 'Music';


SELECT t.name 
FROM track t
	JOIN playlist_track pt
  	    ON t.track_id = pt.track_id
WHERE pt.playlist_id = 5;


SELECT t.name AS track_name, 
	p.name AS playlist_name
FROM track t
    JOIN playlist_track pt
  	    ON t.track_id = pt.track_id
    JOIN playlist p
  	    ON p.playlist_id = pt.playlist_id;


SELECT t.name AS track_name,
	al.title AS album_title
FROM track t
	JOIN album al
  	    ON t.album_id = al.album_id
    JOIN genre g
  	    ON t.genre_id = g.genre_id
WHERE g.name = 'Alternative & Punk';