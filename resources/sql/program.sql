create table if not exists program(
	p_id varchar(10) not null,
	p_name varchar(20),
	p_unitPrice INTEGER,
	p_releaseDate varchar(20),
	p_recentUpdate varchar(20),
	p_producer varchar(40),
	p_category varchar(40),
	p_description TEXT,
	p_fileName varchar(30),
	primary key (p_id)
)default charset=utf8;

desc program;

select * from program;
