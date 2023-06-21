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
alter table member add profile varchar2(100);
alter table member add realprofile varchar2(100);

select*from member;

--������ �����ϴ°� �ƴ϶� �ؽ�Ʈ�� ��ȯ�ؼ� ������,

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
--����Ŭ�� �ڵ������� ����
create table board (
    id          number primary key, --���� ���� ��ȣ  
    userId      varchar2(100)not null, -- member id�� ���� ��ȸ
    name        varchar2(100)not null,
    title       VARCHAR2(300) not null,
    contents    clob not null,
    regdate     date default sysdate,
    hit         number,
    constraint  fk_userid foreign key(userId) references member (id)
--  constraint �������ϴ� ��ŲŰ �̸� foreign key(���� ���̺��� �÷���) references (�ٸ� ���̺� ��)(�ٸ� ���̺��� �÷���)
);

drop table board;

insert into board values (seq_board.nextval,'jang','�强ȣ','�����Դϴ�.','�������Դϴ�.',sysdate,0);
rollback;

select * from board;

select * from board order by id desc; --������ �����´�

select * from board where id >90  and id < 105 order by id desc; --90 ~ 105

select * from member;

delete from board where id = 5;

commit;

select * from board where id = 20;
--
update board set hit = hit + 1 where id = 14; --��ȸ��

-- ��������
select * from
(select rownum as no,b.* from
        (select * from board order by id desc) b) where no  >=1 and no<=10;

--��������
--select rownum,b.* from
--(select * from board order by id desc) b;
--��������
--select b.* from
--(select * from board order by id desc) b;
select count(*) from board;

select rownum,board.* from board; 
--���̺� ���� ���Ҷ� rownum����.

--alter table board modify contents CLOB; --clob�� ĳ���� Ÿ��,blob



create table replyboard (
    id          number primary key, --���� ���� ��ȣ  
    userId      varchar2(100)not null, -- member id�� ���� ��ȸ
    name        varchar2(100)not null,
    title       VARCHAR2(300) not null,
    contents    clob not null,
    regdate     date default sysdate,
    hit         number,
    regroup     number not null,
    relevel     number not null,
    restep      number not null,
    available   number(1) default 0,
    
    constraint  fk02_userid foreign key(userId) references member (id)
);

drop table replyboard;

select nvl (max (regroup),1 )as regroupmax from replyboard;
-- max ���� ū���ڸ� ã���ִ� �Լ�
-- nvl �Լ��� ���࿡ �����ϳ��� ���� null�� ���ö� 1�� ��ü�ض�.

select * from replyboard;

-- ���ۿ� ���� ����� ���� ���� ���� regroup���� relevel�� 1���� ��Ų��...


update replyboard set relevel=relevel+1 where regroup = 3 and relevel > 0;

rollback;

select rownum as no, b.* from(
    select * from replyboard order by regroup desc, relevel asc
)b;
 --desc ������
 delete from replyboard;
 commit;
 
 select *from replyboard where title  like '%��%'; -- like ����Ѱ� ã���ּ���
 
 select * from replyboard where (name like '%��%') or (title like '%��%') or (contents like '%��%');
 
 
 select *from
            ( select rownum as no, b.* from(
                select * from replyboard where name like '%��%' order by regroup desc, relevel ASC
            ) b)
where no >=1 and no <=5;