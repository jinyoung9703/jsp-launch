drop table member;

create table member(
    id           VARCHAR2(100),
    name         VARCHAR2(100),
    password     VARCHAR2(100), 
    address      VARCHAR2(100),
    zipcode      varchar2(100),
    gender      varchar2(100)
);
-- Create  Read Update  Delete �ٳ����� ���� ����
insert into member(id,name,password) values ('jinyoung97','������','1234');
insert into member values ('hong','������','1234','address','zipcode','male');
delete from member; -- ������
delete from member where id = 'jang'; -- ã�Ƽ� ��������
commit; -- ����
ROLLBACK; -- �ѹ�

select id,name,password from member;
select * from member;
select * from member where id = 'jinyoung97' and password = '1234';


