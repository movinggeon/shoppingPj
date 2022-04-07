DROP TABLE members;
CREATE TABLE members (
    mem_name VARCHAR2(300),
    mem_id VARCHAR2(36),
    mem_password VARCHAR2(150),
    mem_email VARCHAR2(300),
    mem_phone VARCHAR2(50),
    mem_birth VARCHAR(30),
    mem_post_code VARCHAR2(30),
    mem_address VARCHAR2(300),
    mem_point NUMBER(10),
    mem_auth VARCHAR2(50),
    mem_enable NUMBER(1)
);

COMMIT;
select * from members;

select now();