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
--오라클은 자동증가가 없다
create table board (
    id          number primary key, --글의 고유 번호  
    userId      varchar2(100)not null, -- member id를 통한 조회
    name        varchar2(100)not null,
    title       VARCHAR2(300) not null,
    contents    VARCHAR2(3000) not null,
    regdate     date default sysdate,
    hit         number,
    constraint  fk_userid foreign key(userId) references member (id)
--  constraint 내가정하는 포킨키 이름 foreign key(현재 테이블의 컬럼명) references (다른 테이블 명)(다른 테이블의 컬럼명)
);

drop table board;

insert into board values (seq_board.nextval,'jang','장성호','제목입니다.','내용이입니다.',sysdate,0);
rollback;

select * from board;

select * from board order by id desc; --순번을 뒤집는다

select * from board where id >90  and id < 105 order by id desc; --90 ~ 105

select * from member;

delete from board where id = 5;

commit;

select * from board where id = 20;
--
update board set hit = hit + 1 where id = 14; --조회수

-- 서브쿼리
select * from
(select rownum as no,b.* from
        (select * from board order by id desc) b) where no  >=1 and no<=10;

--내림차순
--select rownum,b.* from
--(select * from board order by id desc) b;
--오름차순
--select b.* from
--(select * from board order by id desc) b;
select count(*) from board;


