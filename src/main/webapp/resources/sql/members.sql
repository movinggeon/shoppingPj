DROP TABLE members;
CREATE TABLE members (
    mem_name VARCHAR2(300),
    mem_id VARCHAR2(36),
    mem_password VARCHAR2(150),
    mem_email VARCHAR2(300),
    mem_birth VARCHAR(30),
    mem_post_code VARCHAR2(30),
    mem_address VARCHAR2(300)
);

COMMIT;

SELECT * FROM
    members;