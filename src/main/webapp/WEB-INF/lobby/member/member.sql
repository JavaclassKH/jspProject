-- 회원가입(member) 테이블 설계

-- 회원가입(member) 테이블 설계
create table member (
idx int not null auto_increment,        /* 회원 고유번호(PK) */
name varchar(30) not null,              /* 회원 이름 */
mid varchar(30) not null,               /* 회원 아이디 */
pwd varchar(250) not null,               /* 회원 비밀번호 */
nickName varchar(50) not null,          /* 회원 닉네임 */
contact varchar(20) not null,           /* 회원 전화번호 */
email varchar(60) not null,             /* 회원 이메일 */
joinDate datetime default now(),        /* 회원가입 일자 */ 
visitCnt int default 0,                 /* 총 방문 횟수 */
memLevel int default 1,          /* 회원레벨(관리자:0 , 준회원:1 , 정회원:2 , 탈퇴진행회원: 999) */ 
primary key(idx),
unique (mid)
);

drop table member;
desc member;
select * from member;


insert into member values (default,'관리자','admin','1234','관리자','010-5283-0623','kh980614@naver.com',default,default,0);

insert into member values (default,'유소나','sona123','1234','운영자','010-1122-3333','sona123@naver.com',default,default,0);

insert into member values (default,'테스트1','test1','1234','테스터1','010-9876-5432','test1@naver.com',default,default,0);