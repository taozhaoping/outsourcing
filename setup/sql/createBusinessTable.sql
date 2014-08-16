
drop table t_Activities cascade constraints;
drop table t_ActivitiesUser cascade constraints;
drop table t_Certificates cascade constraints;
drop table t_Express cascade constraints;
drop table t_FileInfo cascade constraints;
drop table t_FinancialAffairs cascade constraints;
drop table t_Flight cascade constraints;
drop table t_Hotel cascade constraints;
drop table t_PhysicalExamination cascade constraints;
drop table T_Personnel cascade constraints;
drop table T_Personnel_Record cascade constraints;
drop table t_TechnologicalProcess cascade constraints;
drop table t_TrainCourse cascade constraints;
drop table t_trainingOfPersonnel cascade constraints;

drop sequence SEQUENCE_t_Activities;
drop sequence SEQUENCE_t_ActivitiesUser;
drop sequence SEQUENCE_t_Certificates;
drop sequence SEQUENCE_t_Express;
drop sequence SEQUENCE_t_FileInfo;
drop sequence SEQUENCE_t_FinancialAffairs;
drop sequence SEQUENCE_t_Flight;
drop sequence SEQUENCE_t_Hotel;
drop sequence SEQUENCE_t_PhysicalExamination;
drop sequence SEQUENCE_T_Personnel;
drop sequence SEQUENCE_T_Personnel_Record;
drop sequence SEQUENCE_t_Technological;
drop sequence SEQUENCE_t_TrainCourse;
drop sequence SEQUENCE_t_trainingOfPersonnel;


/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2014/8/12 8:46:12                            */
/*==============================================================*/

/*==============================================================*/
/* Table: Activities                                          */
/* Table: 活动信息表                                          */
/*==============================================================*/
create table t_Activities 
(
   id                 NUMBER               not null,
   name               VARCHAR(20),  --活动名称
   Description        VARCHAR(50),  --活动描述
   ScheduleDate       DATE,         --预定时间
   setTime            VARCHAR(10),  --集合时间
   setPlace           VARCHAR(20),  --集合地点
   ScheduleTime       VARCHAR(10),  --预计活动时间
   userid             NUMBER,       --负责人
   Telephone          VARCHAR(15),  --负责人电话
   createDate         VARCHAR(20),  --创建时间
   updateDate         VARCHAR(20),  --修改时间
   constraint PK_ACTIVITIES primary key (id)
);

/*==============================================================*/
/* Table: ActivitiesUser                                      */
/* Table: 活动人员表                                      */
/*==============================================================*/
create table t_ActivitiesUser 
(
   id                 NUMBER,
   ActivitiesId       NUMBER,  --活动信息id
   Userid             NUMBER,   --人员id
   constraint PK_ActivitiesUser primary key (id)
);

/*==============================================================*/
/* Table: Certificates                                        */
/* Table: 证件信息                                              */
/*==============================================================*/
create table t_Certificates 
(
   id                 NUMBER               not null,
   workflowId                 VARCHAR(10),  --流程节点
   name               VARCHAR(30),          --证件名称
   handleDate         DATE,                 --办理日期
   ReceiveDate        DATE,                 --领取日期
   ValidStartDate     DATE,                 --证件有效开始日期
   ValidEndDate       DATE,                 --证件有效结束日期
   type               VARCHAR(3),           --种类
   createDate         VARCHAR(20),          --创建时间
   updateDate         VARCHAR(20),          --修改时间
   status                   VARCHAR(2),     --状态
   TechnologicalProcessID NUMBER,
   constraint PK_CERTIFICATES primary key (id)
);

/*==============================================================*/
/* Table: Express                                             */
/* 快递信息                                                     */
/*==============================================================*/
create table t_Express 
(
   id                 NUMBER               not null,
   ExpressNumber      VARCHAR(30),      --快递号
   Company            VARCHAR(30),      --快递公司
   Telephone          VARCHAR(15),      --公司电话
   DeliverGoodsDate   DATE,             --发货日期
   ArriveDate         DATE,             --预计到货日期
   TechnologicalProcessID NUMBER,       --人员id
   constraint PK_EXPRESS primary key (id)
);

/*==============================================================*/
/* Table: FileInfo                                            */
/* Table: 文件信息                                            */
/*==============================================================*/
create table t_FileInfo 
(
   id                 NUMBER               not null,
   name               VARCHAR(30),        --文件名
   nameType           VARCHAR(10),        --文件类型
   TYPE                 VARCHAR(20),        --种类
   Descr              VARCHAR(100),       --描述
   createDate         VARCHAR(30),        --创建时间
   updateDate         VARCHAR(30),        --修改时间
   state              VARCHAR(2),         --状态
   TechnologicalProcessID NUMBER,
   constraint PK_FILEINFO primary key (id)
);

/*==============================================================*/
/* Table: FinancialAffairs                                      */
/* Table: 财务信息                                                                                                                                                 */
/*==============================================================*/
create table T_FINANCIALAFFAIRS
(
  id                     NUMBER not null,
  contracttype           VARCHAR2(20),   --合同种类
  companyphone           VARCHAR2(20),   --公司电话号码
  bankcard               VARCHAR2(20),   --工资卡银行
  bankcardnumber         VARCHAR2(30),   --工资卡号码
  wage                   NUMBER,         --工资
  contract_start_date    DATE,           --合同开始日期
  contract_end_date      DATE,           --合同结束日期
  typeofvisa             VARCHAR2(10),   --签证类型
  typeofvisadate         DATE,           --签证到期日
  signingcontractdate    DATE,           --合同正式签订日期
  copytostaff            VARCHAR2(1),    --合同副本是否给外教
  technologicalprocessid NUMBER, 
  constraint PK_FINANCIALAFFAIRS primary key (id)
);

/*==============================================================*/
/* Table: Flight                                              */
/* 航班信息                                                     */
/*==============================================================*/
create table t_Flight 
(
   id                 NUMBER               not null,
   TechnologicalProcessID NUMBER,            --人员ID
   FlightNumber       VARCHAR(20),           --航班号
   startDate          DATE,                  --起飞时间
   endDate            DATE,                  --到达时间
   Place              VARCHAR(30),           --到达机场
   airportPeopleId    NUMBER,                --接机人
   constraint PK_FLIGHT primary key (id)
);

/*==============================================================*/
/* Table: Hotel                                               */
/* Table: 酒店信息                                            */
/*==============================================================*/
create table t_Hotel 
(
   id                 NUMBER               not null,
   name               VARCHAR(20), --酒店名称
   Address            VARCHAR(50), --酒店地址
   Telephone          VARCHAR(15), --酒店电话
   RoomNumber         VARCHAR(10), --房间号
   RoomType           VARCHAR(2),  --房间类型
   ScheduleDate       DATE,        --预定时间
   ScheduleDay        VARCHAR(2),  --预定天数
   CheckInDate        DATE,        --入住时间
   CheckInDay         VARCHAR(2),  --入住天数
   Price              VARCHAR(5),  --价格
   createDate         VARCHAR(20), --创建时间
   updateDate         VARCHAR(20), --修改时间
   TechnologicalProcessID NUMBER,  --人员ID
   constraint PK_HOTEL primary key (id)
);

/*==============================================================*/
/* Table: PhysicalExamination                                 */
/* Table: 体检信息                                 */
/*==============================================================*/
create table t_PhysicalExamination 
(
   id                 NUMBER               not null,
   name               VARCHAR(20), --体检医院
   Address            VARCHAR(30), --体检地址
   Telephone          VARCHAR(20), --医院电话
   Remarks            VARCHAR(50), --医院备注
   type               VARCHAR(2),  --种类
   ScheduleDate       DATE,        --预定时间
   ReceiveDate        DATE,        --报告领取日期 
   TechnologicalProcessID NUMBER,  --人员ID
   constraint PK_PHYSICALEXAMINATION primary key (id)
);

/*==============================================================*/
/* Table: T_Personnel                                         */
/* Table: 人员正式表                                            */
/*==============================================================*/
create table T_Personnel 
(
   id                 NUMBER               not null,
   name               VARCHAR(25), --姓名
   EnglishName        VARCHAR(25), --英文名
   Nationality        VARCHAR(20), --国籍
   YearBirth          VARCHAR(6),  --出生年份
   Birthday           DATE,        --生日
   State              VARCHAR(2),  --状态
   PassportDate       DATE,        --护照日期
   visaType           VARCHAR(1),  --签证类型
   visaDate           DATE,        --签证日期
   contractType       VARCHAR(1),  --合同类型
   contractStartDate  DATE,        --合同签订日期
   InsuranceEndDate   DATE,        --保险到期日 
   school             VARCHAR(50), --所在学校
   intentionSchool    VARCHAR(50), --意向学校
   schoolFeedback     VARCHAR(100),--学校反馈
   createTime         DATE,        --创建日期
   updateTime         DATE,        --修改日期
   mail               VARCHAR(25), --电子邮箱
   constraint PK_T_PERSONNEL primary key (id)
);

/*==============================================================*/
/* Table: T_Personnel_Record                                  */
/* Table: 记录表                                                */
/*==============================================================*/
create table T_Personnel_Record 
(
   id                 NUMBER,
   PersonnelType      VARCHAR(1),  --类型
   appointmentDate    DATE,        --预约时间
   Content            VARCHAR(500),--记录内容
   createTime         DATE,        --创建时间
   PersonnelID        NUMBER,       --人员ID
   constraint PK_Personnel_Record primary key (id)
);

/*==============================================================*/
/* Table: TechnologicalProcess                                */
/*==============================================================*/
create table t_TechnologicalProcess 
(
   id                 NUMBER               not null,
   name               VARCHAR(25),         --姓名
   englishName        VARCHAR(25),         --英文名
   Nationality        VARCHAR(20),         --国籍
   yearBirth          VARCHAR(6),          --出生年份
   Birthday           DATE,                --生日
   state              VARCHAR(2),          --状态
   mail               VARCHAR(25),         --电子邮件
   Phone              VARCHAR(20),         --手机号码
   createTime         VARCHAR(20),         --创建日期
   updateTime         VARCHAR(20),         --修改日期
   workUserId         NUMBER,              --流程发起人
   contractType       VARCHAR(2),          --合同种类
   PassportNo         VARCHAR(30),         --护照号
   PassportNoDate     VARCHAR(20),         --护照有效期
   contractDate       VARCHAR(20),         --合同有效期
   currentLocation    VARCHAR(20),         --目前所在地
   workflowId         VARCHAR(64),         --流水号
   res1               VARCHAR(50),         --扩展字段
   res2               VARCHAR(50),         --
   res3               VARCHAR(50),         --
   res4               VARCHAR(50),         --
   res5               VARCHAR(50),         --
   res6               VARCHAR(50),         --
   constraint PK_TECHNOLOGICALPROCESS primary key (id)
);

/*==============================================================*/
/* Table: TrainCourse                                         */
/* 培训课程信息                                                 */
/*==============================================================*/
create table t_TrainCourse 
(
   id                 NUMBER               not null,
   TrainType          VARCHAR(2),  --培训类别
   ScheduleDate       DATE,        --预定时间
   Address            VARCHAR(20), --地址
   CourseDate         VARCHAR(2),  --课程时间
   Description        VARCHAR(50), --课程描述
   name               VARCHAR(20), --课程名称
   userId             NUMBER,      --课程教师
   createDate         VARCHAR(20), --创建时间
   updateDate         VARCHAR(20), --修改时间
   constraint PK_TRAINCOURSE primary key (id)
);

/*==============================================================*/
/* Table: trainingOfPersonnel                                 */
/* 培训人员信息表                                               */
/*==============================================================*/
create table t_trainingOfPersonnel 
(
   id                 NUMBER               not null,
   TrainCourseId      NUMBER,     --培训课程id
   TechnologicalProcessId NUMBER, --培训人员id
   constraint PK_TRAININGOFPERSONNEL primary key (id)
);

/* 表的外键创建  开始                                               */
/* 
alter table t_ActivitiesUser
   add constraint FK_ACTIVITI_REFERENCE_TECHNOLO foreign key (Userid)
      references t_TechnologicalProcess (id);

alter table t_ActivitiesUser
   add constraint FK_ACTIVITI_REFERENCE_ACTIVITI foreign key (ActivitiesId)
      references t_Activities (id);

alter table t_Certificates
   add constraint FK_CERTIFIC_REFERENCE_TECHNOLO foreign key (TechnologicalProcessID)
      references t_TechnologicalProcess (id);

alter table t_Express
   add constraint FK_EXPRESS_REFERENCE_TECHNOLO foreign key (TechnologicalProcessID)
      references t_TechnologicalProcess (id);

alter table t_FileInfo
   add constraint FK_FILEINFO_REFERENCE_TECHNOLO foreign key (id)
      references t_TechnologicalProcess (id);

alter table t_FinancialAffairs
   add constraint FK_FINANCIA_REFERENCE_TECHNOLO foreign key (TechnologicalProcessID)
      references t_TechnologicalProcess (id);

alter table t_Flight
   add constraint FK_FLIGHT_REFERENCE_TECHNOLO foreign key (TechnologicalProcessID)
      references t_TechnologicalProcess (id);

alter table t_Hotel
   add constraint FK_HOTEL_REFERENCE_TECHNOLO foreign key (TechnologicalProcessID)
      references t_TechnologicalProcess (id);

alter table t_PhysicalExamination
   add constraint FK_PHYSICAL_REFERENCE_TECHNOLO foreign key (TechnologicalProcessID)
      references t_TechnologicalProcess (id);

alter table t_trainingOfPersonnel
   add constraint FK_TRAINING_REFERENCE_TRAINCOU foreign key (TrainCourseId)
      references t_TrainCourse (id);

alter table t_trainingOfPersonnel
   add constraint FK_TRAINING_REFERENCE_TECHNOLO foreign key (TechnologicalProcessId)
      references t_TechnologicalProcess (id);
	   */
/* 表的外键创建  结束                                               */

/* 表 序列                                               */

create sequence SEQUENCE_t_Activities
start with 1
 maxvalue 999999999
 minvalue 1
 cache 10
order;

create sequence SEQUENCE_t_ActivitiesUser
start with 1
 maxvalue 999999999
 minvalue 1
 cache 10
order;

create sequence SEQUENCE_t_Certificates
start with 1
 maxvalue 999999999
 minvalue 1
 cache 10
order;

create sequence SEQUENCE_t_Express
start with 1
 maxvalue 999999999
 minvalue 1
 cache 10
order;

create sequence SEQUENCE_t_FileInfo
start with 1
 maxvalue 999999999
 minvalue 1
 cache 10
order;

create sequence SEQUENCE_t_FinancialAffairs
start with 1
 maxvalue 999999999
 minvalue 1
 cache 10
order;

create sequence SEQUENCE_t_Flight
start with 1
 maxvalue 999999999
 minvalue 1
 cache 10
order;

create sequence SEQUENCE_t_Hotel
start with 1
 maxvalue 999999999
 minvalue 1
 cache 10
order;

create sequence SEQUENCE_t_PhysicalExamination
start with 1
 maxvalue 999999999
 minvalue 1
 cache 10
order;

create sequence SEQUENCE_T_Personnel
start with 1
 maxvalue 999999999
 minvalue 1
 cache 10
order;

create sequence SEQUENCE_T_Personnel_Record
start with 1
 maxvalue 999999999
 minvalue 1
 cache 10
order;

create sequence SEQUENCE_t_Technological
start with 1
 maxvalue 999999999
 minvalue 1
 cache 10
order;

create sequence SEQUENCE_t_TrainCourse
start with 1
 maxvalue 999999999
 minvalue 1
 cache 10
order;

create sequence SEQUENCE_t_trainingOfPersonnel
start with 1
 maxvalue 999999999
 minvalue 1
 cache 10
order;
