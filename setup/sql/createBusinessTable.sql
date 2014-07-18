--业务表创建
drop table T_Personnel cascade constraints;

/*==============================================================*/
/* Table: T_Personnel                                         */
/*==============================================================*/
create table T_Personnel 
(
   id                 NUMBER               not null,
   name                   VARCHAR(25), --名字
   EnglishName                  VARCHAR(25),--英文名字
   Nationality        VARCHAR(20),--国籍
   YearBirth          VARCHAR(6),--出生年
   Birthday           DATE,--生日
   State              VARCHAR(2),--当前状态:0,未联系，1已联系，2.无效记录，3.正在入职，4.已入职
   PassportDate       DATE,--护照到期日
   visaType           VARCHAR(1),--签证类型
   visaDate           DATE,--签证到期日
   contractType       VARCHAR(1),--合同类型
   contractStartDate  DATE,--合同到期日
   InsuranceEndDate   DATE,--保险到期日
   school             VARCHAR(50),--所在学校
   intentionSchool    VARCHAR(50),--意向学校
   schoolFeedback     VARCHAR(100),--学校反馈
   createTime         DATE,--创建日期
   updateTime         DATE,--修改日期（必须随时更新）
   mail               VARCHAR(25),--电子邮箱
   constraint PK_T_PERSONNEL primary key (id)
);


drop table "T_Personnel_Record" cascade constraints;

/*==============================================================*/
/* Table: "T_Personnel_Record"                                  */
/*==============================================================*/
create table "T_Personnel_Record" 
(
   "id"                 NUMBER, --主建
   "PersonnelType"      VARCHAR(1),--类型
   "appointmentDate"    DATE,--预约时间
   "Content"            VARCHAR(500),--记录
   "createTime"         DATE,--创建日期
   "PersonnelID"        NUMBER--Personnel主表ID
);

