USE libraryDB;

CREATE PROCEDURE update_book_isbn (
    IN bookID INT,
    IN newISBN VARCHAR(17),
    OUT isSuccess BOOLEAN
)
BEGIN 
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
        SET isSuccess = FALSE;
ROLLBACK;
END;

    DECLARE bookTitle VARCHAR(255);
    DECLARE oldISBN VARCHAR(17);


START TRANSACTION;

-- getting the existing ISBN of a book
SELECT isbn INTO oldISBN FROM books WHERE id = bookID;

-- updating ISBN of a book
UPDATE books SET isbn = newISBN WHERE id = bookID;

-- fixation of a successful transaction
SET isSuccess = TRUE;
COMMIT;

-- out paraments for declaring the successful transaction
SET isSuccess = TRUE;
end;






