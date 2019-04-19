CREATE TABLE AUTHORS (
    EmailAddr   VARCHAR(50) NOT NULL,
    FirstName   VARCHAR(50) NOT NULL,
    LastName    VARCHAR(50) NOT NULL,
    PRIMARY KEY (EmailAddr)
);

CREATE TABLE PAPERS (
    Paper_id        INT AUTO_INCREMENT,
    Title           VARCHAR(50) NOT NULL,
    Abstract        VARCHAR(255) NOT NULL,
    Paper_FileName  VARCHAR(60) NOT NULL,
    PRIMARY KEY (Paper_id)
);

CREATE TABLE REVIEWER (
    EmailAddr       VARCHAR(50) NOT NULL,
    FirstName       VARCHAR(50) NOT NULL,
    LastName        VARCHAR(50) NOT NULL,
    PhoneNum        VARCHAR(50) NOT NULL,
    Affiliation     VARCHAR(255) NOT NULL,
    AuthFeedback    VARCHAR(255) NOT NULL,
    CommitteeFback  VARCHAR(255) NOT NULL,
    PRIMARY KEY (EmailAddr)
);

CREATE TABLE SUBMITS_PAPER (
    Submission_id   INT AUTO_INCREMENT,
    Paper_id        INT NOT NULL,
    Author_id       VARCHAR(50) NOT NULL,
    PRIMARY KEY (Submission_id),
    FOREIGN KEY (Paper_id) REFERENCES PAPERS(Paper_id),
    FOREIGN KEY (Author_id) REFERENCES AUTHORS(EmailAddr)
);

CREATE TABLE REVIEW (
    Review_id           INT AUTO_INCREMENT,
    Paper_id            INT NOT NULL,
    Reviewer_id         VARCHAR(50) NOT NULL,
    Recommendation      VARCHAR(255) NOT NULL,
    Merit_Score         INT NOT NULL,
    Readability_Score   INT NOT NULL,
    Originality_Score   INT NOT NULL,
    Relevance_Score     INT NOT NULL,
    PRIMARY KEY (Review_id),
    FOREIGN KEY (Paper_id) REFERENCES PAPERS(Paper_id),
    FOREIGN KEY (Reviewer_id) REFERENCES REVIEWER(EmailAddr)
);

CREATE TABLE SUBMITS_REVIEW (
    Submission_id   INT AUTO_INCREMENT,
    Reviewer_id     VARCHAR(50) NOT NULL,
    Review_id       INT NOT NULL,
    PRIMARY KEY (Submission_id),
    FOREIGN KEY (Reviewer_id) REFERENCES REVIEWER(EmailAddr),
    FOREIGN KEY (Review_id) REFERENCES REVIEW(Review_id)
);

CREATE TABLE TOPIC (
    Topic_id        INT AUTO_INCREMENT,
    Topic_Name      VARCHAR(255),
    Reviewer_id     VARCHAR(50),
    PRIMARY KEY (Topic_id),
    FOREIGN KEY (Reviewer_id) REFERENCES REVIEWER(EmailAddr)
);