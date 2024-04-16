USE libraryDB;


    
CREATE VIEW rented_books_view AS
SELECT
    books.title AS title,
    GROUP_CONCAT(authors.name) AS authors,
    CONCAT(publishers.name_pub, books.release_year) AS publisher_info,
    DATE_FORMAT(loans.loan_date, '%YY-%MM-%DD') AS loan_date,
# to calculate the difference between two dates:
    DATEDIFF(loans.due_date, loans.loan_date) AS days_to_end_term
FROM
    loans 
        INNER JOIN
    books  ON loans.book_id = books.id
        INNER JOIN
    books_authors  ON books.id = books_authors.book_id
        INNER JOIN
    authors  ON books_authors.author_id = authors.id
        INNER JOIN
    publishers  ON books.publisher_id = publishers.id
WHERE
    loans.return_date IS NULL
GROUP BY
    loans.id;


SELECT title, authors, publisher_info, loan_date, days_to_end_term FROM librarydb.rented_books_view;


