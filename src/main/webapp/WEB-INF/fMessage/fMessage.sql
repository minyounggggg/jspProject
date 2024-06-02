show tables;

create table fMessage(
	idx 			int not null auto_increment,	/* 메세지 고유번호 */
	title			varchar(100) not null,			/* 메세지 제목 */
	content 		text not null,					/* 메세지 내용 */
	sendId			varchar(20) not null,			/* 보내는 사람 아이디 */
	sendSw			char(1) not null default 's',	/* 보낸메세지(s), 휴지통(g), 휴지통삭제(x) 표시 */
	sendDate		datetime default now(),			/* 메세지 보낸날짜 */
	receiveId		varchar(20) not null,			/* 받는 사람 아이디 */
	receiveSw		char(1) not null default 'n',	/* 받은메세지(n), 읽은메세지(r), 휴지통(g), 휴지통삭제(x) 표시 */
	receiveDate		datetime default now(),			/* 메세지 받은날짜, 읽은날짜 */
	primary key(idx),
	foreign key(sendId) references member(mid),
	foreign key(receiveId) references member(mid)
);