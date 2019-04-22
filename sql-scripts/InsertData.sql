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
INSERT INTO SUBMITS_PAPER (Paper_id, Author_id) VALUES
    (1, 'abc@123.com'),
    (2, 'alpha@bravo.com'),
    (3, 'golf@hotel.com')
;
INSERT INTO REVIEW (Paper_id, Reviewer_id, Recommendation, Merit_Score, 
                    Readability_Score, Originality_Score, Relevance_Score) VALUES
    (1, 'delta@echo.com', 'Overall recommendation to pass this paper to the next round',
        7, 7, 9, 4),
    (1, 'charlie@echo.com', 'Do not send to next round',
        5, 6, 6, 3),
    (2, 'tango@whiskey.com', 'Qualifies to be sent to next round',
        8, 9, 7, 6),
    (2, 'foxtrot@bravo.com', 'Paper eligible for next round',
        7, 8, 6, 7),
    (3, 'papa@charlie.com', 'Paper does not qualify to be sent to next round',
        5, 6, 7, 4)
;
INSERT INTO SUBMITS_REVIEW (Reviewer_id, Review_id) VALUES
    ('delta@echo.com', 1),
    ('charlie@echo.com', 2),
    ('tango@whiskey.com', 3),
    ('foxtrot@bravo.com', 4),
    ('papa@charlie.com', 5)
;
INSERT INTO TOPIC (Topic_Name) VALUES
    ('Human Improvement'),
    ('Psychology'),
    ('Computer Science'),
    ('Information Technology'),
    ('Math'),
    ('Biology'),
    ('Chemistry')
;
INSERT INTO HAS_TOPIC (Topic_id, Reviewer_id) VALUES
    (1, 'delta@echo.com'),
    (2, 'delta@echo.com'),
    (3, 'charlie@echo.com'),
    (4, 'charlie@echo.com'),
    (5, 'charlie@echo.com'),
    (6, 'tango@whiskey.com'),
    (7, 'foxtrot@bravo.com'),
    (4, 'papa@charlie.com'),
    (5, 'papa@charlie.com')
;
INSERT INTO ASSIGNED_PAPER (Paper_id, Reviewer_id) VALUES
    (1, 'delta@echo.com'),
    (1, 'charlie@echo.com'),
    (2, 'tango@whiskey.com'),
    (2, 'foxtrot@bravo.com'),
    (3, 'papa@charlie.com')
;