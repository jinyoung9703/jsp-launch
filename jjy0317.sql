select * from member where id = 'jinyoung97';

drop table member;

create table member(
    id               VARCHAR2(100) unique not null,
     --id               VARCHAR2(100) primary key,
    name             VARCHAR2(100) not null,
    password         VARCHAR2(100) not null,
    email            varchar2(100) not null,
    zonecode         number(5) not null,
    address          varchar2(300) not null,
    detailaddress    varchar2(100),
    extraaddress     varchar2(100)
);
-- Create  Read Update  Delete 다넣을땐 생략 가능
insert into member(id,name,password) values ('jinyoung97','정진영','1234');
insert into member values ('hong','박진영','1234','address','zipcode','male');
delete from member; -- 지워줌
delete from member where id = 'jang1'; -- 찾아서 삭제해줌
commit; -- 저장
ROLLBACK; -- 롤백
select count (*) as count from member where id = 'jang'; --갯수를 알려줌 

select id,name,password from member;
select * from member;
select * from member where id = 'jinyoung97' and password = '1234';

select id,name,address,lpad(zonecode,5,'0') as zonecode,detailAddress from member;

delete from member where id = 'jinyoung97' and password = '1234';
rollback;

update member set name = '정형돈', email = 'jjang051@dsad.dds' where id = 'jinyoung97' and password = '1234';
select * from member;

update member set password = '12345' where id = 'jang';

--자동증가 auto increament my sql은 자동 증가가 있다
create table board (
    id          number primary key,
    name        varchar2(100)not null,
    title       VARCHAR2(300) not null,
    contents    VARCHAR2(3000) not null,
    regdate     date default sysdate,
    hit         number
);

insert into board values (seq_board.nextval,'장성호','제목을 씁니다.','내용이 들어갑니다.',sysdate,0);
rollback;

select * from board;
