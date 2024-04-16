USE librarydb;


-- Task 1 (in, out, inout parameters):

CREATE PROCEDURE get_book_information_sproc (
    IN bookID INT,
    OUT book_title VARCHAR(255),
    INOUT book_ISBN VARCHAR(17)
)
BEGIN
    DECLARE book_edition VARCHAR(255);
    DECLARE book_release_year YEAR;
    DECLARE book_price DECIMAL(10, 2);

    -- Retrieve book information based on bookID
    SELECT title, edition, release_year, price INTO book_title, book_edition, book_release_year, book_price
    FROM books
    WHERE id = bookID;

    -- Update the book ISBN 
    IF book_ISBN IS NOT NULL AND book_ISBN != (SELECT isbn FROM books WHERE id = bookID) THEN
        UPDATE books SET isbn = book_ISBN WHERE id = bookID;
    END IF;

    -- Setting "out" parameter for book title
    SET book_title = CONCAT('Title: ', bookTitle);

    -- Showing the information
    SELECT CONCAT('Edition: ', book_edition) AS book_edition,
           CONCAT('Release Year: ', book_release_year) AS release_year,
           CONCAT('Price: $', book_price) AS price;
END;



-- variables to store the output
SET @title_output = 'The Little Prince';
SET @isbn_input_output = '9780262033848'; 

CALL get_book_information_sproc (4, @titleOutput, @isbnInputOutput);


SELECT @isbn_input_output as book_ISBN;


-- for creating ideas of procedures chat gpt was used



