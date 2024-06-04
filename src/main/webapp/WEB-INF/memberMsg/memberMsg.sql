show tables;

create table memberMsg (
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
	foreign key(sendId) references members(mid),
	foreign key(receiveId) references members(mid)
);

desc memberMsg;
drop table memberMsg;

insert into memberMsg values (default, '안녕! 밀키야 ~', '이번주 주말에 뭐하니?', 'cmy1234', default, default, 'mk1234', 'r', default);
insert into memberMsg values (default, '답장: 반가워 민영', '이번주 주말에 바빠', 'mk1234', default, default, 'cmy1234', 'r', default);
insert into memberMsg values (default, '물어볼게있어', '바쁜거 끝나면 만나자', 'cmy1234', default, default, 'mk1234', default, default);
insert into memberMsg values (default, '음 글쎄', '계속 바쁠꺼같은데', 'mk1234', default, default, 'cmy1234', default, default);
insert into memberMsg values (default, '그래', '알았다', 'cmy1234', default, default, 'mk1234', 'r', default);
insert into memberMsg values (default, '안녕! 아톰 ~', '이번주 주말에 뭐하니?', 'cmy1234', default, default, 'atom', default, default);


select *, timestampdiff(hour, sendDate, now()) as hour_diff from memberMsg where receiveId='mk1234' and (receiveSw='n' or receiveSw='r') order by idx desc;


select * from memberMsg;

