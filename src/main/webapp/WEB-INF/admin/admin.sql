show tables;

/* 리뷰테이블 */
create table comment(
	idx 		int not null auto_increment,		/* 리뷰 고유번호 */
	part 		varchar(20) not null,				/* 분야(게시판:board, 자료실:pds...)*/
	partIdx 	int not null,						/* 해당분야의 고유번호 */
	mid 		varchar(20) not null,				/* 리뷰 올린이 */
	nickName 	varchar(20) not null,				/* 리뷰 올린이 닉네임 */
	star 		int not null default 0,				/* 별점 부여 점수 */
	cmtContent 	text,								/* 리뷰 내용 */
	cmtDate 	datetime default now(),				/* 리뷰 등록일자 */
	primary key(idx),
	foreign key(mid) references members(mid)
);

desc comment;
drop table comment;


/* 리뷰에 댓글 달기 */
create table commentReply(
	replyIdx 		int not null auto_increment,	/* 댓글의 고유번호 */
	reviewIdx 		int not null,					/* 원본글(부모글:리뷰)의 고유번호(외래키로 설정) */
	replyMid 		varchar(20) not null,			/* 댓글 올린이의 아이디 */
	replyNickName 	varchar(20) not null,			/* 댓글 올린이의 닉네임 */
	replyDate 		datetime default now(),			/* 댓글 등록 날짜 */
	replyContent 	text not null,					/* 댓글 내용 */
	primary key(replyIdx),
	foreign key(reviewIdx) references comment(idx),
	foreign key(replyMid) references members(mid)
);
	
	
desc reviewReply;
drop table reviewReply;

