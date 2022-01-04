/*
 * 변경 사항
 * 
 * booking 테이블에 bookingnum(예약자 수) 컬럼 추가
 * interest 테이블 추가
 * program 테이블에 maxbookingnum(최대 예약자 수) 컬럼 추가
 * voc 테이블에 reply_writedate(답변 작성일) 컬럼 추가
 * */

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


/* 시퀀스 삭제 */
DROP SEQUENCE notice_seq;
DROP SEQUENCE voc_seq;
DROP SEQUENCE booking_seq;
DROP SEQUENCE exhibition_seq;
DROP SEQUENCE program_seq;
DROP SEQUENCE share_ticket_seq;
DROP SEQUENCE reply_ticket_seq;


/* 시퀀스 생성 */
CREATE SEQUENCE notice_seq START WITH 1;
CREATE SEQUENCE voc_seq START WITH 1;
CREATE SEQUENCE booking_seq START WITH 1;
CREATE SEQUENCE exhibition_seq START WITH 1;
CREATE SEQUENCE program_seq START WITH 1;
CREATE SEQUENCE share_ticket_seq START WITH 1;
CREATE SEQUENCE reply_ticket_seq START WITH 1;


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


------------------------------------------------------------------------

-- 데이터베이스 모든 테이블 조회
SELECT * FROM tab;



-- DATA 추가
------------------------------------------------------------------------
-- 멤버
INSERT INTO member_mus VALUES('admin', 'admin', '관리자', 'admin@naver.com', '010-0000-0000', '1');
INSERT INTO member_mus VALUES('oneone', '1111', '김일일', 'oneone@naver.com', '010-1111-1111', '0');
INSERT INTO member_mus VALUES('kim', '1234', '김일이', 'kim@naver.com', '010-1212-1212', '0');
INSERT INTO member_mus VALUES('park', '1234', '박삼사', 'park@naver.com', '010-3434-3434', '0');
INSERT INTO member_mus VALUES('lee', '1234', '이오육', 'lee@naver.com', '010-5656-5656', '0');
INSERT INTO member_mus VALUES('hong', '1234', '홍칠팔', 'hong@naver.com', '010-7878-7878', '0');
------------------------------------------------------------------------



-- 해당 테이블 데이터 조회
SELECT * FROM member_mus;
SELECT * FROM booking;
SELECT * FROM exhibition;
SELECT * FROM program;
SELECT * FROM notice;
SELECT * FROM voc;
SELECT * FROM share_ticket;
SELECT * FROM reply_ticket;