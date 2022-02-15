CREATE table members (
    id VARCHAR2(300),
    password VARCHAR2(300)
);

INSERT INTO members VALUES(
    'bb','1234'
);

INSERT INTO members VALUES(
    'bb','1234'
);

commit;

SELECT * FROM
    members;