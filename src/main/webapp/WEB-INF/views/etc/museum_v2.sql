
/* Drop Tables */

DROP TABLE booking CASCADE CONSTRAINTS;
DROP TABLE exhibition CASCADE CONSTRAINTS;
DROP TABLE interest CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE reply_ticket CASCADE CONSTRAINTS;
DROP TABLE share_ticket CASCADE CONSTRAINTS;
DROP TABLE voc CASCADE CONSTRAINTS;
DROP TABLE member_mus CASCADE CONSTRAINTS;
DROP TABLE program CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE booking
(
	-- 예약 번호
	num number(5) NOT NULL,
	-- 회원 아이디
	member_id varchar2(20) NOT NULL,
	-- 프로그램 번호
	program_num number(5) NOT NULL,
	-- 이름
	name varchar2(20),
	-- 전화번호
	phone varchar2(20),
	-- 이메일
	email varchar2(20),
	-- 예약자 수
	bookingnum number(5) DEFAULT 1,
	-- 개인정보수집 동의 여부(0: 미동의, 1: 동의)
	personal_info_yn char(1) DEFAULT '0',
	PRIMARY KEY (num)
);


CREATE TABLE exhibition
(
	num number(5) NOT NULL,
	-- 전시명
	title varchar2(300),
	-- 전시장소
	place varchar2(300),
	-- 전시시작일
	startdate date DEFAULT sysdate,
	-- 전시종료일
	enddate date DEFAULT sysdate,
	-- 이미지
	img varchar2(300),
	-- 상세 내용
	detail_content varchar2(2000),
	PRIMARY KEY (num)
);


CREATE TABLE interest
(
	-- 번호
	num number(5) NOT NULL,
	-- 회원 아이디
	member_id varchar2(20),
	-- 프로그램 번호
	program_num number(5),
	-- 등록일
	writedate date DEFAULT sysdate,
	PRIMARY KEY (num)
);


CREATE TABLE member_mus
(
	-- 아이디
	id varchar2(20) NOT NULL,
	-- 비밀번호
	pwd varchar2(20),
	-- 이름
	name varchar2(20),
	-- 이메일
	email varchar2(40),
	-- 전화번호
	phone varchar2(20),
	-- 관리자 여부(0: 회원, 1: 관리자)
	admin_yn char(1) DEFAULT '0',
	PRIMARY KEY (id)
);


CREATE TABLE notice
(
	-- 번호
	num number(5) NOT NULL,
	-- 작성자
	member_id varchar2(20),
	title varchar2(300),
	-- 내용
	content varchar2(1000),
	-- 작성일
	writedate date DEFAULT sysdate,
	-- 조회수
	readcount number(4),
	PRIMARY KEY (num)
);


CREATE TABLE program
(
	-- 번호
	num number(5) NOT NULL,
	-- 제목
	title varchar2(300),
	-- 내용
	content varchar2(500),
	-- 시작일
	startdate date DEFAULT sysdate,
	-- 종료일
	enddate date DEFAULT sysdate,
	-- 장소
	place varchar2(300),
	-- 대상
	target varchar2(100),
	-- 최대 예약자 수
	maxbookingnum number(5),
	-- 참가비
	entry_fee number(7),
	-- 접수현황
	status varchar2(100),
	-- 이미지
	img varchar2(300),
	-- 상세내용
	detail_content varchar2(2000),
	PRIMARY KEY (num)
);


CREATE TABLE reply_ticket
(
	-- 댓글 번호
	num number(5) NOT NULL,
	-- 티켓나눔터 게시물 번호
	ticket_num number(5),
	-- 회원 아이디
	member_id varchar2(20),
	-- 작성일
	writedate date DEFAULT sysdate,
	-- 내용
	content varchar2(1000),
	PRIMARY KEY (num)
);


CREATE TABLE share_ticket
(
	-- 번호
	num number(5) NOT NULL,
	-- 회원 아이디
	member_id varchar2(20),
	-- 제목
	title varchar2(300),
	-- 내용
	content varchar2(1000),
	-- 작성일
	writedate date DEFAULT sysdate,
	-- 나눔 처리 여부(0: 미처리, 1: 처리)
	share_yn char(1) DEFAULT '0',
	PRIMARY KEY (num)
);


CREATE TABLE voc
(
	-- 번호
	num number(5) NOT NULL,
	-- 작성자
	member_id varchar2(20),
	-- 제목
	title varchar2(300),
	-- 내용
	content varchar2(2000),
	-- 작성일
	writedate date DEFAULT sysdate,
	-- 답변
	reply varchar2(1000),
	-- 답변 작성일
	reply_writedate date DEFAULT sysdate,
	-- 답변 유무(0: 미답변, 1: 답변)
	reply_yn char(1) DEFAULT '0',
	PRIMARY KEY (num)
);



/* Create Foreign Keys */

ALTER TABLE booking
	ADD FOREIGN KEY (member_id)
	REFERENCES member_mus (id)
;


ALTER TABLE interest
	ADD FOREIGN KEY (member_id)
	REFERENCES member_mus (id)
;


ALTER TABLE notice
	ADD FOREIGN KEY (member_id)
	REFERENCES member_mus (id)
;


ALTER TABLE reply_ticket
	ADD FOREIGN KEY (member_id)
	REFERENCES member_mus (id)
;


ALTER TABLE share_ticket
	ADD FOREIGN KEY (member_id)
	REFERENCES member_mus (id)
;


ALTER TABLE voc
	ADD FOREIGN KEY (member_id)
	REFERENCES member_mus (id)
;


ALTER TABLE booking
	ADD FOREIGN KEY (program_num)
	REFERENCES program (num)
;


ALTER TABLE interest
	ADD FOREIGN KEY (program_num)
	REFERENCES program (num)
;


ALTER TABLE reply_ticket
	ADD FOREIGN KEY (ticket_num)
	REFERENCES share_ticket (num)
;



/* Comments */

COMMENT ON COLUMN booking.num IS '예약 번호';
COMMENT ON COLUMN booking.member_id IS '회원 아이디';
COMMENT ON COLUMN booking.program_num IS '프로그램 번호';
COMMENT ON COLUMN booking.name IS '이름';
COMMENT ON COLUMN booking.phone IS '전화번호';
COMMENT ON COLUMN booking.email IS '이메일';
COMMENT ON COLUMN booking.bookingnum IS '예약자 수';
COMMENT ON COLUMN booking.personal_info_yn IS '개인정보수집 동의 여부(0: 미동의, 1: 동의)';
COMMENT ON COLUMN exhibition.title IS '전시명';
COMMENT ON COLUMN exhibition.place IS '전시장소';
COMMENT ON COLUMN exhibition.startdate IS '전시시작일';
COMMENT ON COLUMN exhibition.enddate IS '전시종료일';
COMMENT ON COLUMN exhibition.img IS '이미지';
COMMENT ON COLUMN exhibition.detail_content IS '상세 내용';
COMMENT ON COLUMN interest.num IS '번호';
COMMENT ON COLUMN interest.member_id IS '회원 아이디';
COMMENT ON COLUMN interest.program_num IS '프로그램 번호';
COMMENT ON COLUMN interest.writedate IS '등록일';
COMMENT ON COLUMN member_mus.id IS '아이디';
COMMENT ON COLUMN member_mus.pwd IS '비밀번호';
COMMENT ON COLUMN member_mus.name IS '이름';
COMMENT ON COLUMN member_mus.email IS '이메일';
COMMENT ON COLUMN member_mus.phone IS '전화번호';
COMMENT ON COLUMN member_mus.admin_yn IS '관리자 여부(0: 회원, 1: 관리자)';
COMMENT ON COLUMN notice.num IS '번호';
COMMENT ON COLUMN notice.member_id IS '작성자';
COMMENT ON COLUMN notice.content IS '내용';
COMMENT ON COLUMN notice.writedate IS '작성일';
COMMENT ON COLUMN notice.readcount IS '조회수';
COMMENT ON COLUMN program.num IS '번호';
COMMENT ON COLUMN program.title IS '제목';
COMMENT ON COLUMN program.content IS '내용';
COMMENT ON COLUMN program.startdate IS '시작일';
COMMENT ON COLUMN program.enddate IS '종료일';
COMMENT ON COLUMN program.place IS '장소';
COMMENT ON COLUMN program.target IS '대상';
COMMENT ON COLUMN program.maxbookingnum IS '최대 예약자 수';
COMMENT ON COLUMN program.entry_fee IS '참가비';
COMMENT ON COLUMN program.status IS '접수현황';
COMMENT ON COLUMN program.img IS '이미지';
COMMENT ON COLUMN program.detail_content IS '상세내용';
COMMENT ON COLUMN reply_ticket.num IS '댓글 번호';
COMMENT ON COLUMN reply_ticket.ticket_num IS '티켓나눔터 게시물 번호';
COMMENT ON COLUMN reply_ticket.member_id IS '회원 아이디';
COMMENT ON COLUMN reply_ticket.writedate IS '작성일';
COMMENT ON COLUMN reply_ticket.content IS '내용';
COMMENT ON COLUMN share_ticket.num IS '번호';
COMMENT ON COLUMN share_ticket.member_id IS '회원 아이디';
COMMENT ON COLUMN share_ticket.title IS '제목';
COMMENT ON COLUMN share_ticket.content IS '내용';
COMMENT ON COLUMN share_ticket.writedate IS '작성일';
COMMENT ON COLUMN share_ticket.share_yn IS '나눔 처리 여부(0: 미처리, 1: 처리)';
COMMENT ON COLUMN voc.num IS '번호';
COMMENT ON COLUMN voc.member_id IS '작성자';
COMMENT ON COLUMN voc.title IS '제목';
COMMENT ON COLUMN voc.content IS '내용';
COMMENT ON COLUMN voc.writedate IS '작성일';
COMMENT ON COLUMN voc.reply IS '답변';
COMMENT ON COLUMN voc.reply_writedate IS '답변 작성일';
COMMENT ON COLUMN voc.reply_yn IS '답변 유무(0: 미답변, 1: 답변)';



