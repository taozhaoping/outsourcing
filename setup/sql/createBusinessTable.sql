
drop table t_Activities cascade constraints;
drop table t_ActivitiesUser cascade constraints;
drop table t_Certificates cascade constraints;
drop table t_contact_record cascade constraints;
drop table t_Express cascade constraints;
drop table t_FileInfo cascade constraints;
drop table t_FinancialAffairs cascade constraints;--
drop table t_Flight cascade constraints;
drop table t_Hotel cascade constraints;
drop table t_PhysicalExamination cascade constraints;
drop table T_Personnel cascade constraints;--
drop table T_Personnel_Record cascade constraints;--
drop table t_TechnologicalProcess cascade constraints;
drop table t_TrainCourse cascade constraints;
drop table t_trainingOfPersonnel cascade constraints;
drop table t_Entry_Process cascade constraints;


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
drop sequence SEQUENCE_t_contact_record;

/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2014/8/12 8:46:12                            */
/*==============================================================*/

/*==============================================================*/
/* Table: Activities                                          */
/* Table: 通讯记录表                                          */
/*==============================================================*/
create table t_contact_record
(
   id                 NUMBER               not null,
   createDate       VARCHAR(30),  --创建时间
   TechnologicalProcessID NUMBER,
   descr            varchar(250),
   constraint PK_CONTACT_RECORD primary key (id)
);
/*注释*/
COMMENT ON table t_Activities IS '通话记录';
comment on column t_Activities.id is '主键';
comment on column t_Activities.createDate is '创建时间';
comment on column t_Activities.descr is '描述';

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
   ScheduleDate       VARCHAR(20),  --预定时间
   setTime            VARCHAR(20),  --集合时间
   setPlace           VARCHAR(20),  --集合地点
   ScheduleTime       VARCHAR(10),  --预计活动时间
   userid             NUMBER,       --负责人
   userName           VARCHAR(20),  --负责人姓名
   Telephone          VARCHAR(15),  --负责人电话
   createDate         VARCHAR(20),  --创建时间
   updateDate         VARCHAR(20),  --修改时间
   enabled            VARCHAR(1),  --状态
   constraint PK_ACTIVITIES primary key (id)
);

/*注释*/
COMMENT ON table t_Activities IS '活动信息表 ';
comment on column t_Activities.name is '活动名称';
comment on column t_Activities.Description is '活动描述';
comment on column t_Activities.ScheduleDate is '预定时间';
comment on column t_Activities.setTime is '集合时间';
comment on column t_Activities.setPlace is '集合地点';
comment on column t_Activities.ScheduleTime is '预计活动时间';
comment on column t_Activities.userid is '负责人';
comment on column t_Activities.Telephone is '负责人电话';

/*==============================================================*/
/* Table: ActivitiesUser                                      */
/* Table: 活动人员表                                      */
/*==============================================================*/
create table t_ActivitiesUser 
(
   id                 NUMBER,
   ActivitiesId       NUMBER,  --活动信息id
   TechnologicalProcessID             NUMBER,   --人员id
   createDate         VARCHAR(20),  --创建时间
   constraint PK_ActivitiesUser primary key (id)
);

/*注释*/
COMMENT ON table t_ActivitiesUser IS '活动人员表 ';
comment on column t_ActivitiesUser.ActivitiesId is '活动信息id';
comment on column t_ActivitiesUser.Userid is '人员id';

/*==============================================================*/
/* Table: Certificates                                        */
/* Table: 证件信息                                              */
/*==============================================================*/
create table t_Certificates 
(
   id                 NUMBER               not null,
   workflowId         VARCHAR(10),  		--流程节点
   name               VARCHAR(30),          --证件名称
   serialNumber       VARCHAR(50),          --证件编号
   handleDate         DATE,                 --办理日期
   ReceiveDate        DATE,                 --领取日期
   ValidStartDate     DATE,                 --证件有效开始日期
   ValidEndDate       DATE,                 --证件有效结束日期
   type               VARCHAR(3),           --种类
   createDate         VARCHAR(20),          --创建时间
   updateDate         VARCHAR(20),          --修改时间
   status             VARCHAR(2),     		--状态
   TechnologicalProcessID NUMBER,
   constraint PK_CERTIFICATES primary key (id)
);

/*注释*/
COMMENT ON table t_Certificates IS '证件信息 ';
comment on column t_Certificates.workflowId is '流程节点';
comment on column t_Certificates.name is '证件名称';
comment on column t_Certificates.serialNumber is '证件编号';
comment on column t_Certificates.handleDate is '办理日期';
comment on column t_Certificates.ReceiveDate is '领取日期';
comment on column t_Certificates.ValidStartDate is '证件有效开始日期';
comment on column t_Certificates.ValidEndDate is '证件有效结束日期';
comment on column t_Certificates.type is '种类';
comment on column t_Certificates.status is '状态';
comment on column t_Certificates.TechnologicalProcessID is '人员信息表ID';

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
   ADDRESS         	  VARCHAR(200),     --收件地址
   TechnologicalProcessID NUMBER,       --人员id
   constraint PK_EXPRESS primary key (id)
);

/*注释*/
COMMENT ON table t_Express IS '快递信息 ';
comment on column t_Express.ExpressNumber is '快递号';
comment on column t_Express.Company is '快递公司';
comment on column t_Express.Telephone is '公司电话';
comment on column t_Express.DeliverGoodsDate is '发货日期';
comment on column t_Express.ArriveDate is '预计到货日期';
comment on column t_Express.ADDRESS is '收件地址';
comment on column t_Express.TechnologicalProcessID is '人员id';
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

/*注释*/
COMMENT ON table t_FileInfo IS '文件信息 ';
comment on column t_FileInfo.name is '文件名';
comment on column t_FileInfo.nameType is '文件类型';
comment on column t_FileInfo.TYPE is '种类';
comment on column t_FileInfo.Descr is '描述';
comment on column t_FileInfo.state is '状态';

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

/*注释*/
COMMENT ON table T_FINANCIALAFFAIRS IS '财务信息 ';
comment on column T_FINANCIALAFFAIRS.contracttype is '合同种类';
comment on column T_FINANCIALAFFAIRS.companyphone is '公司电话号码';
comment on column T_FINANCIALAFFAIRS.bankcard is '工资卡银行';
comment on column T_FINANCIALAFFAIRS.bankcardnumber is '工资卡号码';
comment on column T_FINANCIALAFFAIRS.wage is '工资';
comment on column T_FINANCIALAFFAIRS.contract_start_date is '合同开始日期';
comment on column T_FINANCIALAFFAIRS.contract_end_date is '合同结束日期';
comment on column T_FINANCIALAFFAIRS.typeofvisa is '签证类型';
comment on column T_FINANCIALAFFAIRS.typeofvisadate is '签证到期日';
comment on column T_FINANCIALAFFAIRS.signingcontractdate is '合同正式签订日期';
comment on column T_FINANCIALAFFAIRS.copytostaff is '合同副本是否给外教';
comment on column T_FINANCIALAFFAIRS.technologicalprocessid is '人员id';

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

/*注释*/
COMMENT ON table t_Flight IS '航班信息 ';
comment on column t_Flight.TechnologicalProcessID is '人员ID';
comment on column t_Flight.FlightNumber is '航班号';
comment on column t_Flight.startDate is '起飞时间';
comment on column t_Flight.endDate is '到达时间';
comment on column t_Flight.Place is '到达机场';
comment on column t_Flight.airportPeopleId is '接机人';

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

/*注释*/
COMMENT ON table t_Hotel IS '酒店信息 ';
comment on column t_Hotel.name is '酒店名称';
comment on column t_Hotel.Address is '酒店地址';
comment on column t_Hotel.Telephone is '酒店电话';
comment on column t_Hotel.RoomNumber is '房间号';
comment on column t_Hotel.RoomType is '房间类型';
comment on column t_Hotel.ScheduleDate is '预定时间';
comment on column t_Hotel.ScheduleDay is '预定天数';
comment on column t_Hotel.CheckInDay is '入住时间';
comment on column t_Hotel.Price is '价格';
comment on column t_Hotel.TechnologicalProcessID is '人员ID';

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
   createDate         VARCHAR(20), --创建时间
   updateDate         VARCHAR(20), --修改时间
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
   description		  varchar(200), --描述
   DOMICILE 		  VARCHAR(100),--户籍地
   Phone              VARCHAR(20),  --手机号码
   Nationality        VARCHAR(20), --国籍
   YearBirth          VARCHAR(6),  --出生年份
   Birthday           DATE,        --生日
   State              VARCHAR(20),  --状态
   PassportNo         VARCHAR(30),  --护照号
   PassportDate       DATE,        --护照有效期
   visaType           VARCHAR(1),  --签证类型
   visaDate           DATE,        --签证有效期
   contractType       VARCHAR(1),  --合同类型
   contractDate       DATE,  --合同有效期
   createDate         VARCHAR(20),        --创建日期
   updateDate         VARCHAR(20),         --修改日期
   mail               VARCHAR(25), --电子邮箱
   res1               VARCHAR(150),        --扩展字段1
   res2               VARCHAR(150),        --扩展字段2
   res3               VARCHAR(150),        --扩展字段3
   res4               VARCHAR(150),        --扩展字段4
   res5               VARCHAR(150),        --扩展字段5
   res6               VARCHAR(150),        --扩展字段6
   constraint PK_T_PERSONNEL primary key (id)
);

COMMENT ON table T_Personnel IS '员工正式表 ';
comment on column T_Personnel.name is '姓名';
comment on column T_Personnel.EnglishName is '英文名';
comment on column T_Personnel.description is '描述';
comment on column T_Personnel.DOMICILE is '户籍地';
comment on column T_Personnel.Phone is '手机号';
comment on column T_Personnel.Nationality is '国籍';
comment on column T_Personnel.YearBirth is '出生年份';
comment on column T_Personnel.Birthday is '生日';
comment on column T_Personnel.State is '状态';
comment on column T_Personnel.PassportNo is '护照号';
comment on column T_Personnel.PassportDate is '护照有效期';
comment on column T_Personnel.visaType is '签证类型';
comment on column T_Personnel.visaDate is '签证有效期';
comment on column T_Personnel.contractType is '合同类型';
comment on column T_Personnel.contractDate is '合同有效期';
comment on column T_Personnel.mail is '电子邮件';
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
   description		  varchar(200),		   --描述
   name               VARCHAR(25),         --姓名
   englishName        VARCHAR(25),         --英文名
   Nationality        VARCHAR(20),         --国籍
   Domicile			  VARCHAR(100),        --户籍地址
   yearBirth          VARCHAR(6),          --出生年份
   Birthday           DATE,                --生日
   state              VARCHAR(12),         --状态
   mail               VARCHAR(25),         --电子邮件
   Phone              VARCHAR(20),         --手机号码
   skype              VARCHAR(50),         --skype
   wechat             VARCHAR(50),         --wechat
   createTime         VARCHAR(20),         --创建日期
   updateTime         VARCHAR(20),         --修改日期
   workUserId         NUMBER,              --流程发起人
   contractType       VARCHAR(2),          --合同种类
   PassportNo         VARCHAR(30),         --护照号
   PassportNoDate     VARCHAR(20),         --护照有效期
   contractDate       VARCHAR(20),         --合同有效期
   currentLocation    VARCHAR(20),         --目前所在地
   workflowId         VARCHAR(64),         --流水号
   approver			  VARCHAR(150),		   --当前审批人
   taskId			  VARCHAR(50),         --当前任务id
   url				  VARCHAR(150),        --表单的url
   res1               VARCHAR(150),        --扩展字段1
   res2               VARCHAR(150),        --扩展字段2
   res3               VARCHAR(150),        --扩展字段3
   res4               VARCHAR(150),        --扩展字段4
   res5               VARCHAR(150),        --扩展字段5
   res6               VARCHAR(150),        --扩展字段6
   constraint PK_TECHNOLOGICALPROCESS primary key (id)
);

/*==============================================================*/
/* Table: t_Entry_Process  入职流程                                */
/*==============================================================*/
create table t_Entry_Process
(
   id                 NUMBER               not null,
   description		  varchar(200),		   --描述
   name               VARCHAR(25),         --姓名
   englishName        VARCHAR(25),         --英文名
   Nationality        VARCHAR(20),         --国籍
   DOMICILE 		  VARCHAR(100),
   yearBirth          VARCHAR(6),          --出生年份
   Birthday           DATE,                --生日
   state              VARCHAR(12),          --状态
   mail               VARCHAR(25),         --电子邮件
   Phone              VARCHAR(20),         --手机号码
   SKYPE			  VARCHAR(50), 
   WECHAT			  VARCHAR(50), 
   createTime         VARCHAR(20),         --创建日期
   updateTime         VARCHAR(20),         --修改日期
   workUserId         NUMBER,              --流程发起人
   contractType       VARCHAR(2),          --合同种类
   PassportNo         VARCHAR(30),         --护照号
   PassportNoDate     VARCHAR(20),         --护照有效期
   contractDate       VARCHAR(20),         --合同有效期
   currentLocation    VARCHAR(20),         --目前所在地
   workflowId         VARCHAR(64),         --流水号
   approver			  VARCHAR(150),		   --当前审批人
   taskId			  VARCHAR(50),         --当前任务id
   url				  VARCHAR(150),        --表单的url
   res1               VARCHAR(150),        --扩展字段1
   res2               VARCHAR(150),        --扩展字段2
   res3               VARCHAR(150),        --扩展字段3
   res4               VARCHAR(150),        --扩展字段4
   res5               VARCHAR(150),        --扩展字段5
   res6               VARCHAR(150),        --扩展字段6
   constraint PK_Entry_Process primary key (id)
);

/*==============================================================*/
/* Table: TrainCourse                                         */
/* 培训课程信息                                                 */
/*==============================================================*/
create table t_TrainCourse 
(
   id                 NUMBER               not null,
   TrainType          VARCHAR(2),  --培训类别
   ScheduleDate       VARCHAR(20), --预定时间
   Address            VARCHAR(20), --地址
   CourseDate         VARCHAR(2),  --课程时间
   Description        VARCHAR(50), --课程描述
   name               VARCHAR(20), --课程名称
   userId             NUMBER,      --课程教师
   createDate         VARCHAR(20), --创建时间
   updateDate         VARCHAR(20), --修改时间
   enabled            VARCHAR(1),  --状态
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
   createDate         VARCHAR(20), --创建时间
   constraint PK_TRAININGOFPERSONNEL primary key (id)
);

/*注释*/
COMMENT ON table t_trainingOfPersonnel IS '培训人员信息表 ';
comment on column t_trainingOfPersonnel.TrainCourseId is '培训课程id';
comment on column t_trainingOfPersonnel.TechnologicalProcessId is '培训人员id';

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
start with 1000000
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

create sequence SEQUENCE_t_contact_record
start with 1
 maxvalue 999999999
 minvalue 1
 cache 10
order;
/*** 创建触发器 ***/
/*
CREATE OR REPLACE TRIGGER TECHNOLOGICALPROCESS_T
BEFORE DELETE OR INSERT OR UPDATE
ON T_TECHNOLOGICALPROCESS
FOR EACH ROW
DECLARE
createDate    varchar2(20);
modifyDate    varchar2(20);
BEGIN
IF DELETING THEN
	BEGIN
		DBMS_OUTPUT.PUT_LINE('Delete Trigger Operation in table T_TECHNOLOGICALPROCESS');
	END;
END IF;
IF INSERTING THEN
	BEGIN
		select TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS') into createDate from dual;
		select TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS') into modifyDate from dual;
		:new.CREATETIME := createDate;
		:new.UPDATETIME := modifyDate;
		EXCEPTION
		WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('Failed Insert Trigger Operation in table T_TECHNOLOGICALPROCESS');
	END;
END IF;
IF UPDATING THEN
	BEGIN
		select TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS') into modifyDate from dual;
		:new.UPDATETIME := modifyDate;
		EXCEPTION
		WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('Failed Update Trigger Operation in table T_TECHNOLOGICALPROCESS');
	END;
END IF;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Failed Other Trigger Operation in table T_TECHNOLOGICALPROCESS');
END;
*/

commit;