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
-- Create  Read Update  Delete �ٳ����� ���� ����
insert into member(id,name,password) values ('jinyoung97','������','1234');
insert into member values ('hong','������','1234','address','zipcode','male');
delete from member; -- ������
delete from member where id = 'jang1'; -- ã�Ƽ� ��������
commit; -- ����
ROLLBACK; -- �ѹ�
select count (*) as count from member where id = 'jang'; --������ �˷��� 

select id,name,password from member;
select * from member;
select * from member where id = 'jinyoung97' and password = '1234';

select id,name,address,lpad(zonecode,5,'0') as zonecode,detailAddress from member;

delete from member where id = 'jinyoung97' and password = '1234';
rollback;

update member set name = '������', email = 'jjang051@dsad.dds' where id = 'jinyoung97' and password = '1234';
select * from member;

update member set password = '12345' where id = 'jang';

--�ڵ����� auto increament my sql�� �ڵ� ������ �ִ�
create table board (
    id          number primary key,
    name        varchar2(100)not null,
    title       VARCHAR2(300) not null,
    contents    VARCHAR2(3000) not null,
    regdate     date default sysdate,
    hit         number
);

insert into board values (seq_board.nextval,'�强ȣ','������ ���ϴ�.','������ ���ϴ�.',sysdate,0);
rollback;

select * from board;
