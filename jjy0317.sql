-- 명령어 쓸 수 있음...
create table member (
    id         varchar2(100),
    name       varchar2(100),
    password   varchar2(100)
);
drop table member; -- 테이블 삭제

insert into member (id,name,password)  values ('jinyoung0317','정진영','1234');
insert into member (id,name,password)  values ('hong','홍길동','1234');
commit;

select * from member;