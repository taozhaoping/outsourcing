/*==============================================================*/
/* Table: t_contact_record_vw                                      */
/* Table: 联系记录视图                                                                                                                                            */
/*==============================================================*/
CREATE OR REPLACE VIEW t_contact_record_vw AS
select b.id,name,workuserid,state,c.descr,c.type,c.reservedate,createdate from T_TECHNOLOGICALPROCESS b left join (select * from T_CONTACT_RECORD a where a.createdate=(select max(createdate) from T_CONTACT_RECORD b where a.technologicalprocessid=b.technologicalprocessid)) c on c.technologicalprocessid=b.id 
