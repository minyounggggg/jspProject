show tables;

create table fMessage(
	idx 			int not null auto_increment,	/* 메세지 고유번호 */
	title			varchar(100) not null,			/* 메세지 제목 */
	content 		text not null,					/* 메세지 내용 */
	sendId			varchar(20) not null,			/* 보내는 사람 아이디 */
	sendDate		datetime default now(),			/* 메세지 보낸날짜 */
	receiveId		varchar(20) not null,			/* 받는 사람 아이디 */
	receiveSw		char(1) not null default 'n',	/* 받은메세지(n), 친구신청 거절 누르면 삭제(x)로 변경하여 표시 (db에서 x로되어있는 메세지는 바로 삭제 되도록) */
	primary key(idx),
	foreign key(sendId) references members(mid),
	foreign key(receiveId) references members(mid)
);

drop table fMessage;
desc fMessage;
select * from fMessage;