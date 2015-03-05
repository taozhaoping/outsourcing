/*==============================================================*/
/* Table: t_contact_record_vw                                      */
/* Table: 联系记录视图                                                                                                                                            */
/*==============================================================*/
drop view t_contact_record_vw;
drop view t_franchisee_record_VW;

CREATE OR REPLACE VIEW t_contact_record_vw AS
select b.id,name,workuserid,state,c.descr,c.type,c.reservedate,createdate from T_TECHNOLOGICALPROCESS b left join (select * from T_CONTACT_RECORD a where a.createdate=(select max(createdate) from T_CONTACT_RECORD b where a.technologicalprocessid=b.technologicalprocessid)) c 
on c.technologicalprocessid=b.id ;

--加盟商联系记录视图

CREATE OR REPLACE VIEW t_franchisee_record_VW AS
select b.f_id id,
	b.CHANGE_NUMBER,
       f_name name,
       b.owner createUserId,
       c.descr,
       c.type,
       c.reservedate,
       c.createdate
  from v_the_franchisee_change b
  left join (select *
               from t_franchisee_record a
              where a.createdate = (select max(createdate)
                                      from t_franchisee_record d
                                     where a.franchiseeid = d.franchiseeid)) c
    on c.FRANCHISEEID = b.f_id
   where b.STATUS != '完成';

