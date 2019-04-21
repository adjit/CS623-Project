USE Conference_Review;

INSERT INTO AUTHORS (EmailAddr, FirstName, LastName) VALUES
    ('abc@123.com', 'Alpha', 'Bravo'),
    ('def@123.com', 'Delta', 'Echo'),
    ('ghi@123.com', 'Golf', 'Hotel'),
    ('alpha@bravo.com', 'James', 'Dean'),
    ('delta@echo.com', 'Bill', 'Thorton'),
    ('golf@hotel.com', 'Tony', 'Daniels')
;
INSERT INTO PAPERS (Title, Abstract, Paper_FileName) VALUES
    ('The Chronicles of Narnia', 'Was it a good idea to go into that closet?', 'chronicles.pdf'),
    ('Guiding Decisions', 'How to help students make the right decisions for themselves', 'decisions.pdf'),
    ('Measuring Success', 'Measure the success of each decision made in order to find the best path forward', 'success.pdf')
;
INSERT INTO REVIEWER (EmailAddr, FirstName, LastName, PhoneNum, Affiliation, AuthFeedback, CommitteeFback) VALUES
    ('delta@echo.com', 'James', 'Dean', '555-123-4567', 'Peer Reviwer',
        'Paper was written well with an interesting topic',
        'Paper was well written, but could use some work on the reason for entering the closet'),
    ('charlie@echo.com', 'Phillip', 'Morris', '222-432-7853', 'Tenured Professor',
        'The real question is why did he enter the closet?',
        'Too many unanswered questions'),
    ('tango@whiskey.com', 'John', 'Smith', '324-543-7583', 'Professor',
        'Well written. Conveys the proper steps for guidance',
        'Authors did a good job conveying their message to the readers'),
    ('foxtrot@bravo.com', 'Miles', 'Mills', '847-987-2379', 'Peer Reviewer',
        'Topic is expressed clearly and the reader given a proper understanding',
        'The topic is well written about and the authors do a good job conveying proper messaging'),
    ('papa@charlie.com', 'Bob', 'Hope', '324-834-0234', 'Tenured Professor',
        'Need to do a better job explaining how to use the measurements to find the best path',
        'The authors needed to elaborate more on their topic')
;