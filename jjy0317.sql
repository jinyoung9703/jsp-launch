drop table member;

create table member(
    id           VARCHAR2(100),
    name         VARCHAR2(100),
    password     VARCHAR2(100), 
    address      VARCHAR2(100),
    zipcode      varchar2(100),
    gender      varchar2(100)
);
-- Create  Read Update  Delete 다넣을땐 생략 가능
insert into member(id,name,password) values ('jinyoung97','정진영','1234');
insert into member values ('hong','박진영','1234','address','zipcode','male');
delete from member; -- 지워줌
delete from member where id = 'jang'; -- 찾아서 삭제해줌
commit; -- 저장
ROLLBACK; -- 롤백

select id,name,password from member;
select * from member;
select * from member where id = 'jinyoung97' and password = '1234';


