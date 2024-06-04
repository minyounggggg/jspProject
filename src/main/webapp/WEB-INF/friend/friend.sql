show tables;

create table friend (
	idx 			int not null auto_increment,	/* 고유번호 */
	mid       		varchar(30) not null,			/* 본인 아이디 */
	friendMid		varchar(30) not null,			/* 친구 아이디 */
	accept			char(2) default 'NO',			/* 친구신청 수락(OK), 거절(NO) */
	primary key (idx),
	foreign key (mid) references members(mid)
);
/*	memo			varchar(100),			*/		/* 메모 */

desc friend;
drop table friend;
select * from friend;

select * from friend where mid="atom" and friendMid="etom";
select * from friend where mid="atom" and friendMid="btom";

delete from friend where mid="atom" and friendMid="btom";

select * from friend where mid="atom" and accept="OK";

select members.* from members, friend where friend.mid="atom" AND friend.friendMid = members.mid AND friend.accept='OK';

select m.*, f.accept from members m, friend f where m.mid;