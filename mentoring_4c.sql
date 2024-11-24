-- 1. Berapa banyak buku yang ada di setiap library?
SELECT 
	library_name,
	SUM(quantity) AS total_book
FROM libraries
RIGHT JOIN book_library USING(library_id)
GROUP BY library_name
ORDER BY 2 DESC

-- 2.  Kategori buku apa yang quantitynya paling banyak?
SELECT
	book_category,
	SUM(quantity) AS quantity
FROM books
LEFT JOIN category USING(category_id)
LEFT JOIN book_library USING(book_id)
GROUP BY book_category
ORDER BY quantity DESC


-- 3. Penulis yang menulis buku paling banyak
SELECT
	author_name,
	SUM(quantity) AS quantity
FROM books
LEFT JOIN authors USING(author_id)
LEFT JOIN book_library USING(book_id)
GROUP BY author_name
ORDER BY quantity DESC
LIMIT 10


-- 4. Buku dengan unavailable status terbanyak?

SELECT 
    book_name, 
    COUNT(copy_id) AS total_buku_unavailable
FROM books
RIGHT JOIN copies USING (book_id)
WHERE availibility_status = 'unavailable'
GROUP BY book_id, book_name
ORDER BY 2 DESC
LIMIT 10

-- 5. Rata-rata rentang waktu pengembalian buku
SELECT 
    ROUND(AVG(return_date - loan_date),2) AS average_return_days
FROM loans
WHERE return_date IS NOT NULL;

