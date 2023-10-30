
show user;
--USER이(가) "SEMI_ORAUSER4"입니다.

create table tbl_박윤수
(no number
,name varchar2(20)
);

insert into tbl_박윤수(no, name) values(11, '하하하');
--1 행 이(가) 삽입되었습니다.

commit;

create table tbl_member     
(userid             varchar2(40)   not null  -- 회원아이디
,pwd                varchar2(200)  not null  -- 비밀번호 (SHA-256 암호화 대상)
,name               varchar2(30)   not null  -- 회원명
,email              varchar2(200)  not null  -- 이메일 (AES-256 암호화/복호화 대상)
,mobile             varchar2(200)            -- 연락처 (AES-256 암호화/복호화 대상) 
,postcode           varchar2(5)              -- 우편번호
,address            varchar2(200)            -- 주소
,detailaddress      varchar2(200)            -- 상세주소
,extraaddress       varchar2(200)            -- 참고항목
,gender             varchar2(1)              -- 성별   남자:1  / 여자:2
,birthday           varchar2(10)             -- 생년월일   
,coin               number default 0         -- 코인액
,point              number default 0         -- 포인트 
,registerday        date default sysdate     -- 가입일자 
,lastpwdchangedate  date default sysdate     -- 마지막으로 암호를 변경한 날짜  
,status             number(1) default 1 not null     -- 회원탈퇴유무   1: 사용가능(가입중) / 0:사용불능(탈퇴) 
,idle               number(1) default 0 not null     -- 휴면유무      0 : 활동중  /  1 : 휴면중 
,constraint PK_tbl_member_userid primary key(userid)
,constraint UQ_tbl_member_email  unique(email)
,constraint CK_tbl_member_gender check( gender in('1','2') )
,constraint CK_tbl_member_status check( status in(0,1) )
,constraint CK_tbl_member_idle check( idle in(0,1) )
);
-- Table TBL_MEMBER이(가) 생성되었습니다.

select *
from tbl_member
order by registerday desc;


create table tbl_category
(cnum    number(8)     not null  -- 카테고리 대분류 번호
,code    varchar2(20)  not null  -- 카테고리 코드
,cname   varchar2(100) not null  -- 카테고리명
,constraint PK_tbl_category_cnum primary key(cnum)
,constraint UQ_tbl_category_code unique(code)
);

create sequence seq_category_cnum 
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into tbl_category(cnum, code, cname) values(seq_category_cnum.nextval, '100000', '스페셜');
insert into tbl_category(cnum, code, cname) values(seq_category_cnum.nextval, '200000', '신제품');
insert into tbl_category(cnum, code, cname) values(seq_category_cnum.nextval, '300000', '프리미엄');
insert into tbl_category(cnum, code, cname) values(seq_category_cnum.nextval, '400000', '와퍼');
insert into tbl_category(cnum, code, cname) values(seq_category_cnum.nextval, '500000', '치킨버거');
insert into tbl_category(cnum, code, cname) values(seq_category_cnum.nextval, '600000', '사이드');
insert into tbl_category(cnum, code, cname) values(seq_category_cnum.nextval, '700000', '음료');
commit;


drop table tbl_category purge;
drop sequence seq_category_cnum;


select *
from tbl_category;

insert into tbl_product(pnum, pname, fk_cnum, pimage, pqty, price, pcontent, pdetail)
values(seq_tbl_product_pnum.nextval, '갈릭불고기와퍼', 4, '갈릭불고기와퍼.png', 100, 8300, null, null);

insert into tbl_product(pnum, pname, fk_cnum, pimage, pqty, price, pcontent, pdetail)
values(seq_tbl_product_pnum.nextval, '불고기와퍼', 4, '불고기와퍼.png', 100, 8000, '불에 직접 구운 순 쇠고기 패티가 들어간 와퍼에 달콤한 불고기 소스까지!', null);

insert into tbl_product(pnum, pname, fk_cnum, pimage, pqty, price, pcontent, pdetail)
values(seq_tbl_product_pnum.nextval, '와퍼', 4, '와퍼.png', 100, 8000, '불에 직접 구운 순 쇠고기 패티에 싱싱한 야채가 한가득~ 버거킹의 대표 메뉴!', null);

insert into tbl_product(pnum, pname, fk_cnum, pimage, pqty, price, pcontent, pdetail)
values(seq_tbl_product_pnum.nextval, '치즈와퍼', 4, '치즈와퍼.png', 100, 8300, '불에 직접 구운 순 쇠고기 패티가 들어간 와퍼에 고소한 치즈까지!', null);

insert into tbl_product(pnum, pname, fk_cnum, pimage, pqty, price, pcontent, pdetail)
values(seq_tbl_product_pnum.nextval, '콰트로치즈와퍼', 4, '콰트로치즈와퍼.png', 100, 8300, '진짜 불맛을 즐겨라, 4가지 고품격 치즈와 불에 직접 구운 와퍼 패티의 만남!', null);


commit;


insert into tbl_product(pnum, pname, fk_cnum, pimage, pqty, price, pcontent, pdetail)
values(seq_tbl_product_pnum.nextval, '롱치킨버거', 5, '롱치킨버거.png', 100, 5600, '담백한 치킨 패티에 부드러운 마요네즈 소스와 싱싱한 야채가 듬뿍~', null);

insert into tbl_product(pnum, pname, fk_cnum, pimage, pqty, price, pcontent, pdetail)
values(seq_tbl_product_pnum.nextval, '바비큐치킨버거', 5, '바비큐치킨버거.png', 100, 4600, '진한 바비큐 소스가 가득!', null);

insert into tbl_product(pnum, pname, fk_cnum, pimage, pqty, price, pcontent, pdetail)
values(seq_tbl_product_pnum.nextval, '치킨버거', 5, '치킨버거.png', 100, 4600, '부드러운 에그번과 킹치킨패티의 만남! 풍부한 마요 소스로 고소하게!', null);

insert into tbl_product(pnum, pname, fk_cnum, pimage, pqty, price, pcontent, pdetail)
values(seq_tbl_product_pnum.nextval, '치킨킹', 5, '치킨킹.png', 100, 7400, '스파이시한 통닭다리살과 고소한 브리오쉬번이 만나 더 풍부해진 프리미엄 치킨버거. 치킨킹!', null);

insert into tbl_product(pnum, pname, fk_cnum, pimage, pqty, price, pcontent, pdetail)
values(seq_tbl_product_pnum.nextval, '치킨킹BTL', 5, '치킨킹BTL.png', 100, 8400, '스파이시한 통닭다리살 프리미엄 치킨버거에 베이컨, 양상추, 토마토를 더했다. 치킨킹 BLT!', null);


select *
from tbl_product
where fk_cnum = 1
order by pnum desc;
