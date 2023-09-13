create table if not exists post(
	p_id int not null,
	p_title varchar(30),
	p_category varchar(20),
	p_content TEXT,
	p_date varchar(30),
	p_fileName varchar(30),
	primary key (p_id)
)default charset=utf8;

