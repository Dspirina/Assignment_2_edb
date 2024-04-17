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
        LEFT JOIN
    books  ON loans.book_id = books.id
        LEFT JOIN
    books_authors  ON books.id = books_authors.books_id
       LEFT JOIN
    authors  ON books_authors.authors_id = authors.id
        LEFT JOIN
    publishers  ON books.publisher_id = publishers.id
WHERE
    loans.return_date IS NULL
GROUP BY
    loans.id;


SELECT title, authors, publisher_info, loan_date, days_to_end_term FROM rented_books_view;


select * from books;
