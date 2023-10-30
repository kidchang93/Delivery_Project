CREATE database delivery;

CREATE TABLE `user` (
	user_id VARCHAR(15) NOT NULL PRIMARY KEY COMMENT '회원 ID',
	user_name VARCHAR(10) NOT NULL COMMENT '회원 성함',
	user_pw VARCHAR(20) not null COMMENT '회원 비밀번호',
	user_addr VARCHAR(100) not null COMMENT '회원 주소',
	user_cp VARCHAR(20) not null comment '회원 전화번호',
	user_DAddr VARCHAR(30) NOT NULL COMMENT '회원 상세주소',
	user_grade INT(10) comment '등급'
	
);

create table `nonuser` (
	`non_cp` VARCHAR(20) not null comment '비회원 전화번호',
	`non_name` VARCHAR(10) NOT NULL COMMENT '비회원 성함',
	`non_addr` VARCHAR(100) not null COMMENT '비회원 주소',
	`non_Daddr` varchar(30) not null comment '비회원 상세주소',
	`reg_date` DATETIME NOT NULL DEFAULT current_timestamp() comment '등록날짜',
	PRIMARY KEY (`non_cp`)
);

create table `waybill` (
	`waybill_no` varchar(10) not null comment '운송장 번호',
	`rcvr_name` VARCHAR(10) not null comment '받는사람 이름',
	`rcvr_addr` varchar(100) not null comment '받는사람 주소',
	`rcvr_Daddr` varchar(30) not null comment '받는사람 상세주소',
	`rcvr_cp` varchar(20) not null comment '받는사람 전화번호',
	`company_cd` varchar(2) comment '택배사 코드',
	`user_id` varchar(15) comment '회원 ID',
	`non_cp` varchar(20) comment '비회원 전화번호',
	`reg_date` DATETIME NOT NULL DEFAULT current_timestamp() comment '등록날짜',
	`total_fee` int(20) comment '최종 요금',
	`up_date` DATETIME comment '받은날짜',
	`msg` varchar(30) comment '요청사항',
	 primary key (`waybill_no`)
);

create table company(
	`company_cd` varchar(2) NOT NULL comment '택배사 코드',
	`company_name` varchar(30) comment '택배사명',
	primary key (`company_cd`)
);

create table parcel(
	`parcel_no` int(10) NOT NULL AUTO_INCREMENT  comment '택배 번호',
	`parcel_name` varchar(10) NOT NULL comment '택배 명',
	`parcel_weight` int(10) comment '택배 무게',
	`parcel_size` varchar(15) comment '택배 크기',
	`parcel_fee` int(10) comment '요금',
	`waybill_no` VARCHAR(10) not null comment '운송장 번호',
	 primary key (`parcel_no`)
);

CREATE TABLE `sigugun` (
	`zipcode` INT(10) NULL DEFAULT NULL,
	`sido` VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`sigugun` VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`eup` VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`dong` VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`num` INT(10) NULL DEFAULT NULL,
	`bunum` INT(10) NULL DEFAULT NULL
);

create table user_address(
	user_id VARCHAR(15) NOT NULL  comment '유저ID',
	rcvr_name VARCHAR(10) not null comment '받는사람 이름',
	rcvr_addr varchar(100) not null comment '받는사람 주소',
	rcvr_Daddr varchar(30) not null comment '받는사람 상세주소',
	rcvr_cp varchar(20) not null comment '받는사람 전화번호'
);

load data local infile 'D:/lck_data/Delivery_Project/data3.txt' into table sigugun fields terminated BY '\t' lines terminated by '\n';

-- 경로 오류가 아니라 세팅의 오류(error code 2068)라면
-- 터미널에서 local_infile 설정해줘야함
-- mysql none 상태에서 set global variables like 'local_infile';
-- off 상태면 set global local_infile=1;
-- set global variables like 'local_infile'; 다시 실행하면 on 으로 바뀜
-- 그 다음에 use delivery; 한 다음 위에 경로 지정된 명령문 세팅하면 query ok 라고 뜸



select * from sigugun;

select * from sigugun;
select * from company;

insert into company values('01', 'CJ대한통운');
insert into company values('02', '롯데택배');
insert into company values('03', '우체국택배');
insert into company values('04', '로젠택배');
insert into company values('05', '한진택배');
insert into company values('06', 'CU 편의점택배');
insert into company values('07', 'EMS 택배');
insert into company values('08', '경동택배');
insert into company values('09', '대신택배');
insert into company values('10', 'DHL 택배');
insert into company values('11', '하이택배');
insert into company values('12', 'CVSnet 편의점택배');
insert into company values('13', '합동택배');
insert into company values('14', '천일택배');
insert into company values('15', 'APEX 택배');
insert into company values('16', '세방 택배');
insert into company values('17', 'KGB택배');
insert into company values('18', 'SLX 택배');
insert into company values('19', '일양로지스');
insert into company values('20', '홈픽택배');
