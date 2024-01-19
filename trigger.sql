CREATE TABLE your_table (
    your_column INT
);

-- Create the trigger
CREATE TRIGGER before_insert_trigger
ON your_table
INSTEAD OF INSERT
AS
BEGIN
    -- Check if the value already exists
    IF EXISTS (SELECT 1 FROM your_table WHERE your_column IN (SELECT your_column FROM INSERTED))
    BEGIN
        THROW 50000, 'Value already exists in your_table', 1;
    END
    ELSE
    BEGIN
        -- If the value doesn't exist, perform the insertion
        INSERT INTO your_table (your_column)
        SELECT your_column FROM INSERTED;
    END
END;



-- Try to insert a value (this will fail if the value already exists)
INSERT INTO your_table (your_column) VALUES (2);
