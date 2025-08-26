drop table transaction_details;
drop table scheme_info;
drop table group_info;
drop table rgmf3;

create table user_master
(
	user_id varchar(900) primary key,
	password varchar(4000) not null,
	role varchar(100) not null,
	login_date date not null,
	last_login date,
	failed_login date
);

create table product
(
	product_id bigint identity primary key,
	product_name varchar(1500) unique not null,
	live_rate float not null,
	previous_rate float,
	update_date date not null
);


create table group_info
(
	group_code varchar(100) primary key,
	scheme_name varchar(2000),
	scheme_type varchar(100),
	tot_ins int
);


create table rgmf3
(
	account varchar(900) primary key,
	name varchar(200),
	mobile_no varchar(12),
	paid_insts int,
	total_weight float,
	tot_paid_amount bigint,
	last_paid_date date
);


create table scheme_info
(
	reg_no bigint identity(1,1) primary key,
	group_code varchar(100) foreign key references group_info(group_code),
	amount bigint,
	start_date date,
	mature_date date,
	name varchar(100),
	mobile_no varchar(100),
	address varchar(4000)
);
CREATE SEQUENCE MySequence START WITH 100;

create table transaction_details
(
	trans_id bigint IDENTITY(1,1) primary key ,
	inst_no int,
	type_of_trans varchar(100),
	rate_on_pay float,
	paid_date date,
	amount bigint,
	receipt_no bigint DEFAULT NEXT VALUE FOR MySequence,
	weight float,
	reg_no bigint foreign key references scheme_info(reg_no)
);

insert into product(product_name,live_rate,update_date) values ('GOLD',9450.10,getdate());
insert into product(product_name,live_rate,update_date) values ('SILVER',945.10,getdate());

select * from product;

insert into user_master values ('GEETHA','Geetha','Admin','','','');

insert into group_info values('RGMF3','11 GOLDEN MONTHS FLEXIBLE 3','Weight',11);
insert into group_info values('RBTSS2','RTM BIG TREE SAVINGS SCHEME 2','Amount',11);
insert into group_info values('RSAP','11 GOLDEN MONTHS SUPER ADVANCE PLAN','Amount',11);
insert into group_info values('RDG','REVATHI DIGI GOLD','Weight',11);

insert into scheme_info
([group_code],[amount],[start_date],[mature_date],[name],[mobile_no],[address])
values('RGMF3',10000,getdate(),DATEADD(year, 1, GETDATE()),'Jayan','9780654312','MA Nagar');

insert into scheme_info 
([group_code],[amount],[start_date],[mature_date],[name],[mobile_no],[address])
values('RGMF3',5000,getdate(),DATEADD(year, 1, GETDATE()),'Lakshmi','9780654313','Redhills');

insert into scheme_info 
([group_code],[amount],[start_date],[mature_date],[name],[mobile_no],[address])
values('RGMF3',25000,getdate(),DATEADD(year, 1, GETDATE()),'Mithra','9780654314','Perambur');


insert into transaction_details ([inst_no],[type_of_trans],[rate_on_pay],[paid_date],[amount],[weight],[reg_no])
values(1,'DIRECT TRANSACTION',9445.00,getdate()-30,10000,1.086,1);

insert into transaction_details ([inst_no],[type_of_trans],[rate_on_pay],[paid_date],[amount],[weight],[reg_no])
values(1,'DIRECT TRANSACTION',9445.00,getdate()-30,5000,0.70,2);

insert into transaction_details ([inst_no],[type_of_trans],[rate_on_pay],[paid_date],[amount],[weight],[reg_no])
values(1,'DIRECT TRANSACTION',9100.00,getdate()-30,25000,2.091,3);

select DATEADD(year, 1, getdate());
select getdate();

--drop table rgmf3;


select * from transaction_details;

create or alter procedure sp_update_Rgmf3(@regNo bigint)
as
begin
	declare @account varchar(900),@name varchar(100),@total_amount bigint,@mobile varchar(12);
	declare @total_weight float,@paid_insts int;
	declare @count int,@last_paid_date date;

	select @account=concat(group_code,'-',reg_no),@name=name,@mobile=mobile_no
	from scheme_info where reg_no=@regNo

	select 
			@total_weight=sum(weight),@total_amount=sum(amount),
			@paid_insts= max(inst_no),@last_paid_date=max(paid_date)
	from transaction_details 
	where reg_no=@regNo;

	select @total_amount,@total_weight,@paid_insts;

	select @count=count(*) from rgmf3 where account=@account;

	if @count=0
	begin
		insert into rgmf3 values(@account,@name,@mobile,@paid_insts,@total_weight,@total_amount,@last_paid_date);
	end;
	else
	begin
		update rgmf3 
		set tot_paid_amount=@total_amount,total_weight=@total_weight,
			paid_insts=@paid_insts,last_paid_date=@last_paid_date
		where account=@account;
	end;
end;

exec sp_update_Rgmf3 3;

select * from scheme_info;
select * from transaction_details;
select * from rgmf3;

exec sp_help 'transaction_details';

create function fnGetGroupCode(@account varchar(900))
returns varchar(50) as
begin
	declare @groupcode varchar(900),@regno varchar(100);
	
	--declare cursor
	declare mycursor cursor for
	select value from string_split(@account,'-');

	--open cursor
	open mycursor;

	--fetch cursor
	fetch next from mycursor into @groupcode;

	close mycursor;

	deallocate mycursor;

	return @groupcode;
end;

select dbo.fnGetGroupCode('RGMF3-2');

create or alter proc spGetAccountDetails(@account varchar(900))
as
begin
	
	declare @groupcode varchar(200),@regno bigint;
	declare @scheme varchar(1000);

	select @groupcode=substring(@account,0,len(@account)-1),@regno=substring(@account,7,len(@account));

	select @scheme= scheme_name 
	from group_info 
	where group_code=@groupcode;

	if(@groupcode='RGMF3')
	begin
		select name,mobile_no,account,paid_insts,tot_paid_amount,total_weight,@scheme as scheme
		from rgmf3 where account=@account;
	end;
end;


select * from rgmf3;

exec spGetAccountDetails 'RGMF3-2';
select @groupcode=value,@regno=value from string_split('RGMF3-2','-');
select @groupcode;



select * from transaction_details;


create proc spGetTransactionDetails(@regno bigint)
as
begin
	select inst_no as instNo,type_of_trans as typeOfTrans,rate_on_pay as rateOnPay,
			paid_date as paidDate,receipt_no as receiptNo,amount,weight
	from transaction_details
	where reg_no=@regno;
end;

exec spGetTransactionDetails 1;

select * from group_info;



create proc spAddScheme(@group_code varchar(900),@regno bigint)
as
begin
	declare @scount int=0;
	declare @rcount int=0;

	begin try
		select @scount=count(*) 
		from scheme_info
		where group_code=@group_code and reg_no=@regno;

		if(@scount=1)
		begin
			select concat(group_code,'-',reg_no)
			from scheme_info
			where group_code=@group_code and reg_no=@regno;
		end;
		else
			throw 50001,'Scheme not Found',1;
	end try
	begin catch
		throw;
	end catch
end;

select last_paid_date from rgmf3 where account='RGMF3-1';
select * from transaction_details;
create or alter proc spGetSchemeDetails(@account varchar(900))
as
begin
	declare @groupcode varchar(200),@regno bigint;
	declare @scheme varchar(1000),@lastpaid date,@status varchar(50);

	select @groupcode=substring(@account,0,len(@account)-1),@regno=substring(@account,7,len(@account));

	select @lastpaid=last_paid_date
	from rgmf3 where account=@account;

	if(DATEPART(mm,@lastpaid))=datepart(mm,getDate())
		set @status='Paid';
	else
		set @status='Pay';

	if(@groupcode='RGMF3')
	begin
		declare @live_rate int,@amt float,@wgt float;
		select @amt=amount from scheme_info where reg_no=@regno;
		select @live_rate=live_rate from product where product_name='GOLD';
		set @wgt= round(@amt/@live_rate,3);

		select @scheme= scheme_name 
		from group_info 
		where group_code=@groupcode;

		select name,account,@amt as amount,paid_insts as paidIns,@wgt as weight,@scheme as scheme,@status as status
		from rgmf3
		where account=@account;
	end;
end;

select * from group_info;
exec spGetSchemeDetails 'RGMF3-2';

select len(account) from rgmf3;

select substring(account,0,len(account)-1) from rgmf3;

select * from transaction_details;

select * from rgmf3;



create or alter proc spPayInst(@typeOfTrans varchar(500),@amount bigint,@account varchar(900))
as
begin
	declare @wgt float,@live_rate float,@inst int,@count int;
	declare @v_amt bigint,@lastpay date;

	declare @groupcode varchar(200),@regno bigint;

	select @groupcode=substring(@account,0,len(@account)-1),@regno=substring(@account,7,len(@account));
	select @live_rate=live_rate
	from product
	where product_name='GOLD';

	set @wgt=round(@amount/@live_rate,3);

	if(@groupcode='RGMF3')
	begin
		select @count=count(*) 
		from rgmf3
		where account=@account;

		if(@count=1)
		begin
	
			select @v_amt=amount from scheme_info where reg_no=@regno;

			if(@v_amt!=@amount)
				throw 50002,'Amount Does Not Match',10;
			
			select @inst=paid_insts
			from rgmf3
			where account=@account;	

			select @lastpay= max(paid_date)
			from transaction_details
			where reg_no=@regno;

			if(datepart(MM,getdate())=datepart(MM,@lastpay))
				throw 50002,'This Month Installment is Already Paid',3;

			insert into transaction_details ([inst_no],[type_of_trans],[rate_on_pay],[paid_date],[amount],[weight],[reg_no])
			values(@inst+1,@typeOfTrans,@live_rate,getdate(),@amount,@wgt,@regno);

			update rgmf3
			set paid_insts=paid_insts+1,total_weight=round(total_weight+@wgt,3),
				tot_paid_amount=tot_paid_amount+@amount,last_paid_date=GETDATE()
			where account=@account;
		end;
		else
			throw 50003,'Account Not Found',1;
	end;
end;

exec spPayInst 'DIRECT TRANSACTION',5000,'RGMF3-2';

SELECT getdate(),DATEPART(MM, getdate()),DATEPART(m, '11-12-2002');

select paid_date,datepart(MM,paid_date) from transaction_details;

select * from scheme_info;


create proc spGetProductRate
as
begin
	select product_name,live_rate
	from product
	where product_name in('GOLD','SILVER');
end;

select * from product;


create proc spGetOnlineTransactions(@account varchar(900))
as
begin
	
	declare @regno bigint;
	select @regno=substring(@account,7,len(@account));
	
	select paid_date as payDate,trans_id as transId,amount,@account as account,inst_no as ins,receipt_no as receipt
	from transaction_details
	where reg_no=@regno and type_of_trans!='DIRECT TRANSACTION';

end;

exec spGetOnlineTransactions 'RGMF3-3';

select * from transaction_details;


create or alter proc spUserLogin(@userId varchar(900),@pwd varchar(4000))
as
begin
	declare @count int;
	select @count=count(*) from user_master where user_id=@userId and password=@pwd;

	if(@count=1)
		select user_id from user_master where user_id=@userId and password=@pwd;
	else
		throw 50001,'INVALID CREDENTIALS',16;
end;

select * from group_info;

create proc spSchemeList
as
begin
	select scheme_name as scheme,scheme_type as schemeType,tot_ins as ins,getdate() as joinDate
	from group_info;
end;

exec spSchemeList;

select * from rgmf3;

select * from transaction_details;

select * from scheme_info;

create proc spJoinScheme(