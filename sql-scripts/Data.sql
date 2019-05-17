SELECT
    sp.Paper_id,
    p.Title,
    p.Abstract,
    a.EmailAddr,
    a.FirstName,
    a.LastName
FROM SUBMITS_PAPER sp
Join PAPERS p
    ON sp.Paper_id = p.Paper_id
JOIN AUTHORS a
    on sp.Author_id = a.EmailAddr
WHERE sp.Author_id = 'abc@123.com'