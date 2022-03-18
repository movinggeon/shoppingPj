/* 그냥 넣어 놨는데 안썻음 */
drop table files;
drop table replies;
drop table boards;
drop table likes;
drop table coupons; 
drop table carts;
drop table members;
drop table specifications;
drop table models;
drop table products;

commit;
/*----------------*/

drop table products;
create table products(
    product_id int,
    product_name varchar(50)
);

drop table models;
create table models(
    model_id int,
    product_id int,
    model_name varchar(50)
);

drop table specifications;
create table specifications(
    spec_id int,
    model_id int,
    spec_processor varchar(100),
    spec_memory varchar(100),
    spec_display varchar(100),
    spec_network varchar(100),
    spec_weight int,   
    spec_color varchar(50),
    spec_price int,
    spec_qty int
);

DROP TABLE members;
CREATE TABLE members (
    mem_name varchar(300),
    mem_id varchar(36),
    mem_password varchar(150),
    mem_email varchar(300),
    mem_phone varchar(50),
    mem_birth VARCHAR(30),
    mem_post_code varchar(30),
    mem_address varchar(300),
    mem_point int(10),
    mem_auth varchar(50),
    mem_enable int(1)
);


drop table carts;
create table carts(
    cart_id int,
    spec_id int,
    mem_id varchar(36),
    cart_imp_uid varchar(500),
    cart_merchant_uid varchar(500),
    cart_price int,
    cart_qty int,
    cart_date varchar(30),
    cart_refund int,
    cart_repair_date varchar(30),
    cart_r_est_date varchar(30),
    cart_address varchar(300),
    cart_phone varchar(300),
    cart_isCare int
);

drop table coupons;
create table coupons(
    coupon_id int,
    mem_id varchar(36),
    coupon_desc varchar(100),
    coupon_pct int,
    coupon_price int,
    coupon_valid_date varchar(36)
);


drop table likes;
create table likes(
    like_id int,
    spec_id int,
    mem_id varchar(26)
);


drop table boards;
create table boards(
    board_id int,
    mem_id varchar(36),
    spec_id int,
    board_rate int,
    board_title varchar(100),
    board_content varchar(100),
    board_date varchar(30),
    board_type varchar(30)
);

drop table replies;
create table replies(
    reply_id int,
    mem_id varchar(36),
    board_id int,
    reply_content varchar(500),
    reply_date varchar(30)
);

drop table files;
create table files(
    file_id int,
    board_id int,
    file_name varchar(100)
);

commit;

