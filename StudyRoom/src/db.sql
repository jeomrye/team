--회원정보
CREATE TABLE member (
    userid VARCHAR2(50) NOT NULL,
    memberNo NUMBER NOT NULL,
    username VARCHAR2(50) NOT NULL,
    password VARCHAR2(200) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    phone VARCHAR2(30) NOT NULL,
    gender varchar2(20) NOT NULL,
    regdate DATE default sysdate,
    updatedate DATE default sysdate,
    mileage number default 0,
    companynumber varchar2(30) default null, 
    CONSTRAINT PK_MEMBER PRIMARY KEY 
  (
    USERID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX PK_MEMBER ON MEMBER (USERID ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NOPARALLEL;

--회원 외래키
ALTER TABLE MEMBER
ADD CONSTRAINT MEMBER_FK1 FOREIGN KEY
(
  COMPANYNUMBER 
)
REFERENCES COMPANY
(
  COMPANYNUMBER 
)
ENABLE;

--자동로그인
create table persistent_logins(
    username varchar2(50) not null,
    series varchar2(200) primary key,
    token varchar2(200) not null,
    last_used timestamp not null
);

--회원권한 
CREATE TABLE auth (
	userid VARCHAR2(50) NOT NULL,
	auth VARCHAR2(100) NOT NULL
);

--회원권한 기본키
ALTER TABLE auth ADD CONSTRAINT PK_auth_member PRIMARY KEY (userid);

--회원 권한 참조키 
ALTER TABLE auth
	ADD
		CONSTRAINT FK_auth_member
		FOREIGN KEY (
			userid
		)
		REFERENCES member (
			userid
		) on delete cascade;

--사업자 등록번호
CREATE TABLE company (
	companynumber varchar2(30) NOT NULL
);

--사업자 기본키
ALTER TABLE company ADD CONSTRAINT PK_company PRIMARY KEY (companynumber);

--자유게시판
CREATE TABLE Free (
	fno NUMBER NOT NULL,
	title VARCHAR2(500) NOT NULL,
	content VARCHAR2(4000) NOT NULL,
	writer VARCHAR2(300) NOT NULL,
	regdate DATE default sysdate,
	updatedate DATE default sysdate,
	userid VARCHAR2(50)
);

-- 자유게시판 기본키
ALTER TABLE Free ADD CONSTRAINT PK_Free PRIMARY KEY (fno);

-- 자유게시판 참조키
ALTER TABLE Free
	ADD
		CONSTRAINT FK_Free_member
		FOREIGN KEY (
			userid
		)
		REFERENCES member (
			userid
		)  on delete cascade;

 -- 자유게시판 시퀸스
 create sequence Free_seq
  start with 0
  MINVALUE 0
  increment by 1 
  maxvalue 100000;

--자유게시판 댓글
CREATE TABLE Freereply (
	rno NUMBER NOT NULL,
	reply VARCHAR2(400) not null,
	replyer VARCHAR2(50) not null,
	replydate DATE default sysdate,
	updatedate DATE default sysdate,
	fno NUMBER
);

--자유게시판 댓글 기본키
ALTER TABLE Freereply ADD CONSTRAINT PK_Freereply PRIMARY KEY (rno);

--자유게시판 댓글 참조키(on delete 추가)
ALTER TABLE Freereply
	ADD
		CONSTRAINT FK_Freereply_Free
		FOREIGN KEY (
			fno
		)
		REFERENCES Free (
			fno
		)  on delete cascade;

--자유게시판 댓글 시퀸스 
create sequence Freereply_seq
  start with 0
  MINVALUE 0
  increment by 1 
  maxvalue 100000;

--공지사항
CREATE TABLE notice (
	notNo NUMBER NOT NULL,
	title VARCHAR2(500) NOT NULL,
	content VARCHAR2(4000) NOT NULL,
	writer VARCHAR2(100) NOT NULL,
	regdate DATE default sysdate,
	updatedate DATE default sysdate,
	userid VARCHAR2(50)
);

--공지사항 기본키
ALTER TABLE notice ADD CONSTRAINT PK_notice PRIMARY KEY (notNo);

--공지사항 외래키
ALTER TABLE notice
	ADD
		CONSTRAINT FK_notice_member
		FOREIGN KEY (
			userid
		)
		REFERENCES member (
			userid
		);

--공지사항 시퀸스
create sequence seq_notice;


-- 쿠폰
CREATE TABLE coupon (
	couponNumber number NOT NULL,
	couponName VARCHAR2(100) NOT NULL,
	couponPrice number NOT NULL,
	couponUse number default 0,
	couponregDate DATE default sysdate,
	couponupdateDate DATE default sysdate   
);

--쿠폰 기본키
ALTER TABLE coupon ADD CONSTRAINT PK_coupon PRIMARY KEY (couponNumber);

--쿠폰 시퀸스
create sequence coupon_seq;

--쿠폰 이미지란에 들어갈 테이블
create table attach(
uuid varchar2(100) not null,
uploadPath varchar2(200) not null,
fileName varchar2(100) not null,
fileType char(1) default 'I',
couponNumber number (10, 0)
);

--쿠폰 기본키
Alter table attach add constraint pk_attach primary key (uuid);

--쿠폰 외래키
alter table attach add constraint fk_coupon_attach foreign key (couponNumber) references coupon(couponNumber) on delete cascade;

--쿠폰 디테일
create table coupon_detail(
 USERID VARCHAR2(40 BYTE) NOT NULL primary key,
 couponNumber number NOT NULL,
 couponName VARCHAR2(100) NOT NULL,
 couponPrice number NOT NULL,
 couponUse number default 0,
 couponBuyDate Date default sysdate,
 coup number not null
 );
 
--쿠폰 디테일 시퀀스
create sequence coup_seq;

--쿠폰 디테일 외래키
alter table coupon_detail add constraint fk_member_coupon_detail foreign key (userid) references member(userid) on delete cascade;
alter table coupon_detail add constraint fk_coupon_coupon_detail foreign key (couponNumber) references coupon(couponNumber);

-- 장소관리
CREATE TABLE place (
	bno NUMBER NOT NULL,
	score NUMBER  default 0 NOT NULL,
	title VARCHAR2(500) NOT NULL,
	offer VARCHAR2(500),
	extra VARCHAR2(500),
	content VARCHAR2(4000) NOT NULL,
	time VARCHAR2(100) NOT NULL,
	clean VARCHAR2(100) NOT NULL,
	tel varchar2(100) NOT NULL,
	address VARCHAR2(150) NOT NULL,
	page VARCHAR2(100),
	writer VARCHAR2(100) NOT NULL,
	regdate DATE default sysdate,
	updatedate DATE  default sysdate,
    	placerecnt number default 0,
	userid VARCHAR2(50)
);

--장소관리 기본키
ALTER TABLE place ADD CONSTRAINT PK_place PRIMARY KEY (bno);

--장소관리 외래키
ALTER TABLE place
	ADD
		CONSTRAINT FK_place_member
		FOREIGN KEY (
			userid
		)
		REFERENCES member (
			userid
		) on delete cascade;

--장소관리 시퀸스
create sequence seq_place;

--장소관리 리뷰
CREATE TABLE placeReply (
	rno NUMBER NOT NULL,
	reply VARCHAR2(4000) NOT NULL,
	score NUMBER NOT NULL,
	replyer VARCHAR2(50) NOT NULL,
	replydate DATE  default sysdate,
	updatedate DATE default sysdate,
	bno NUMBER
);

--장소관리 리뷰 기본키
ALTER TABLE placeReply ADD CONSTRAINT PK_placeReply PRIMARY KEY (rno);

--장소관리 리뷰 외래키
ALTER TABLE placeReply
	ADD
		CONSTRAINT FK_placeReply_place
		FOREIGN KEY (
			bno
		)
		REFERENCES place (
			bno
		) on delete cascade;

--장소관리 리뷰 시퀸스
create sequence seq_placere;

--장소관리 사진
CREATE TABLE placephoto (
	uuid VARCHAR2(100) NOT NULL,
	uploadpath VARCHAR2(200) NOT NULL,
	filename VARCHAR2(100) NOT NULL,
	filetype varchar2(10),
	bno NUMBER
);

--장소관리 사진 기본키
ALTER TABLE placephoto ADD CONSTRAINT PK_placephoto PRIMARY KEY (uuid);

--장소관리 사진 외래키
ALTER TABLE placephoto
	ADD
		CONSTRAINT FK_placephoto_place
		FOREIGN KEY (
			bno
		)
		REFERENCES place (
			bno
		) on delete cascade;

--Q&A 질문
CREATE TABLE QuestionAndAnswer (
	questionNo NUMBER NOT NULL,
	title VARCHAR2(500) NOT NULL,
	content VARCHAR2(4000) NOT NULL,
	writer VARCHAR2(100) NOT NULL,
	writedate DATE default sysdate,
	updatedate DATE default sysdate,
	qnacnt NUMBER,
	status VARCHAR2(100),
	pub VARCHAR2(100),
	password NUMBER,
	userid VARCHAR2(50)
);

--Q&A 질문 기본키
ALTER TABLE QuestionAndAnswer ADD CONSTRAINT PK_QuestionAndAnswer PRIMARY KEY (questionNo);

--Q&A 질문 외래키
ALTER TABLE QuestionAndAnswer
	ADD
		CONSTRAINT FK_QuestionAndAnswer_member
		FOREIGN KEY (userid)
		REFERENCES member (userid) on delete cascade;
--Q&A 질문 시퀀스
create sequence seq_QuestionAndAnswer;

--자주묻는 질문
CREATE TABLE FAQ (
	faqNo NUMBER NOT NULL,
	title VARCHAR2(500) NOT NULL,
	content VARCHAR2(4000) NOT NULL,
	writer VARCHAR2(100) NOT NULL,
	writedate DATE default sysdate,
	faqcnt NUMBER,
	userid VARCHAR2(50)
);

--자주묻는 질문 기본키
ALTER TABLE FAQ ADD CONSTRAINT PK_FAQ PRIMARY KEY (faqNo);

--자주묻는 질문 외래키
ALTER TABLE FAQ
	ADD
		CONSTRAINT FK_FAQ_member
		FOREIGN KEY (userid)
		REFERENCES member (userid);

--자주묻는 질문 시퀸스
create sequence seq_faq;

--Q&A 답변
create table QuestionAndAnswer_reply(
    rno number(10,0),
    questionNo number(10,0) not null,
    reply varchar2(4000) not null,
    replyer varchar2(50) not null,
    replyDate date default sysdate,
    updateDate date default sysdate
    );

--Q&A 답변 기본키
alter table QuestionAndAnswer_reply add constraint pk_reply primary key(rNo);

--Q&A 답변 외래키
alter table QuestionAndAnswer_reply add constraint fk_reply_QuestionAndAnswer foreign key(questionNo) references QuestionAndAnswer(questionNo) on delete cascade;

--Q&A 답변 시퀸스
create sequence seq_reply;

commit;