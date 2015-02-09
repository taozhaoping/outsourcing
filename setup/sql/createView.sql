/*==============================================================*/
/* Table: t_contact_record_vw                                      */
/* Table: 联系记录视图                                                                                                                                            */
/*==============================================================*/
CREATE OR REPLACE VIEW t_contact_record_vw AS
select b.id,name,workuserid,state,c.descr,c.type,c.reservedate,createdate from T_TECHNOLOGICALPROCESS b left join (select * from T_CONTACT_RECORD a where a.createdate=(select max(createdate) from T_CONTACT_RECORD b where a.technologicalprocessid=b.technologicalprocessid)) c on c.technologicalprocessid=b.id 

--加盟商联系记录视图
CREATE OR REPLACE VIEW t_franchisee_record_VW AS
select b.id,
       name,
       b.createUserId,
       c.descr,
       c.type,
       c.reservedate,
       c.createdate
  from t_The_franchisee b
  left join (select *
               from t_franchisee_record a
              where a.createdate = (select max(createdate)
                                      from t_franchisee_record b
                                     where a.id = b.id)) c
    on c.FRANCHISEEID = b.id
