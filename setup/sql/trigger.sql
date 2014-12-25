---------------------------------------------
-- Export file for user OSFI               --
-- Created by 21829 on 2014/9/11, 19:09:36 --
---------------------------------------------

set define off
spool trigger.log

prompt
prompt Creating trigger PHYSICALEXAMINATION_T
prompt =============================
prompt
prompt
CREATE OR REPLACE TRIGGER PHYSICALEXAMINATION_T
BEFORE DELETE OR INSERT OR UPDATE
ON T_PHYSICALEXAMINATION
FOR EACH ROW
DECLARE
createDate    varchar2(20);
modifyDate    varchar2(20);
BEGIN
IF DELETING THEN
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Delete Trigger Operation in table T_PHYSICALEXAMINATION');
  END;
END IF;
IF INSERTING THEN
  BEGIN
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into createDate from dual;
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into modifyDate from dual;
    :new.CREATEDATE := createDate;
    :new.UPDATEDATE := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Insert Trigger Operation in table T_PHYSICALEXAMINATION');
  END;
END IF;
IF UPDATING THEN
  BEGIN
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into modifyDate from dual;
    :new.UPDATEDATE := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Update Trigger Operation in table T_PHYSICALEXAMINATION');
  END;
END IF;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Failed Other Trigger Operation in table T_PHYSICALEXAMINATION');
END;
/

prompt
prompt Creating trigger HOTEL_T
prompt =============================
prompt
prompt
CREATE OR REPLACE TRIGGER HOTEL_T
BEFORE DELETE OR INSERT OR UPDATE
ON T_HOTEL
FOR EACH ROW
DECLARE
createDate    varchar2(20);
modifyDate    varchar2(20);
BEGIN
IF DELETING THEN
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Delete Trigger Operation in table T_HOTEL');
  END;
END IF;
IF INSERTING THEN
  BEGIN
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into createDate from dual;
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into modifyDate from dual;
    :new.CREATEDATE := createDate;
    :new.UPDATEDATE := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Insert Trigger Operation in table T_HOTEL');
  END;
END IF;
IF UPDATING THEN
  BEGIN
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into modifyDate from dual;
    :new.UPDATEDATE := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Update Trigger Operation in table T_HOTEL');
  END;
END IF;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Failed Other Trigger Operation in table T_HOTEL');
END;
/

prompt
prompt Creating trigger TRAININGOFPERSONNEL_T
prompt =============================
prompt
CREATE OR REPLACE TRIGGER TRAININGOFPERSONNEL_T
BEFORE DELETE OR INSERT OR UPDATE
ON T_TRAININGOFPERSONNEL
FOR EACH ROW
DECLARE
createDate    varchar2(20);
BEGIN
IF DELETING THEN
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Delete Trigger Operation in table T_TRAININGOFPERSONNEL');
  END;
END IF;
IF INSERTING THEN
  BEGIN
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into createDate from dual;
    :new.CREATEDATE := createDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Insert Trigger Operation in table T_TRAININGOFPERSONNEL');
  END;
END IF;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Failed Other Trigger Operation in table T_TRAININGOFPERSONNEL');
END;
/

prompt
prompt Creating trigger ACTIVITIES_T
prompt =============================
prompt
CREATE OR REPLACE TRIGGER ACTIVITIES_T
BEFORE DELETE OR INSERT OR UPDATE
ON T_ACTIVITIES
FOR EACH ROW
DECLARE
createDate    varchar2(20);
modifyDate    varchar2(20);
BEGIN
IF DELETING THEN
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Delete Trigger Operation in table T_ACTIVITIES');
  END;
END IF;
IF INSERTING THEN
  BEGIN
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into createDate from dual;
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into modifyDate from dual;
    :new.CREATEDATE := createDate;
    :new.UPDATEDATE := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Insert Trigger Operation in table T_ACTIVITIES');
  END;
END IF;
IF UPDATING THEN
  BEGIN
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into modifyDate from dual;
    :new.UPDATEDATE := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Update Trigger Operation in table T_ACTIVITIES');
  END;
END IF;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Failed Other Trigger Operation in table T_ACTIVITIES');
END;
/

prompt
prompt Creating trigger CERTIFICATES_T
prompt ===============================
prompt
CREATE OR REPLACE TRIGGER CERTIFICATES_T
BEFORE DELETE OR INSERT OR UPDATE
ON T_CERTIFICATES
FOR EACH ROW
DECLARE
createDate    varchar2(20);
modifyDate    varchar2(20);
BEGIN
IF DELETING THEN
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Delete Trigger Operation in table T_CERTIFICATES');
  END;
END IF;
IF INSERTING THEN
  BEGIN
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into createDate from dual;
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into modifyDate from dual;
    :new.CREATEDATE := createDate;
    :new.UPDATEDATE := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Insert Trigger Operation in table T_CERTIFICATES');
  END;
END IF;
IF UPDATING THEN
  BEGIN
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into modifyDate from dual;
    :new.UPDATEDATE := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Update Trigger Operation in table T_CERTIFICATES');
  END;
END IF;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Failed Other Trigger Operation in table T_CERTIFICATES');
END;
/

prompt
prompt Creating trigger FILEINFO_T
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER FILEINFO_T
BEFORE DELETE OR INSERT OR UPDATE
ON T_FILEINFO
FOR EACH ROW
DECLARE
createDate    varchar2(20);
modifyDate    varchar2(20);
BEGIN
IF DELETING THEN
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Delete Trigger Operation in table T_FILEINFO');
  END;
END IF;
IF INSERTING THEN
  BEGIN
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into createDate from dual;
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into modifyDate from dual;
    :new.CREATEDATE := createDate;
    :new.UPDATEDATE := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Insert Trigger Operation in table T_FILEINFO');
  END;
END IF;
IF UPDATING THEN
  BEGIN
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into modifyDate from dual;
    :new.UPDATEDATE := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Update Trigger Operation in table T_FILEINFO');
  END;
END IF;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Failed Other Trigger Operation in table T_FILEINFO');
END;
/

prompt
prompt Creating trigger HOTEL_T
prompt ========================
prompt
CREATE OR REPLACE TRIGGER HOTEL_T
BEFORE DELETE OR INSERT OR UPDATE
ON T_HOTEL
FOR EACH ROW
DECLARE
createDate    varchar2(20);
modifyDate    varchar2(20);
BEGIN
IF DELETING THEN
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Delete Trigger Operation in table T_HOTEL');
  END;
END IF;
IF INSERTING THEN
  BEGIN
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into createDate from dual;
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into modifyDate from dual;
    :new.CREATEDATE := createDate;
    :new.UPDATEDATE := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Insert Trigger Operation in table T_HOTEL');
  END;
END IF;
IF UPDATING THEN
  BEGIN
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into modifyDate from dual;
    :new.UPDATEDATE := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Update Trigger Operation in table T_HOTEL');
  END;
END IF;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Failed Other Trigger Operation in table T_HOTEL');
END;
/

prompt
prompt Creating trigger SYS_RESOURCEINFO_T
prompt ===================================
prompt
CREATE OR REPLACE TRIGGER SYS_RESOURCEINFO_T
BEFORE DELETE OR INSERT OR UPDATE
ON SYS_RESOURCEINFO
FOR EACH ROW
DECLARE
createDate    date;
modifyDate    date;
BEGIN
IF DELETING THEN
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Delete Trigger Operation in table SYS_RESOURCEINFO');
  END;
END IF;
IF INSERTING THEN
  BEGIN
    select SYSDATE into createDate from dual;
    select SYSDATE into modifyDate from dual;
    :new.CREATETIME := createDate;
    :new.UPDATETIME := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Insert Trigger Operation in table SYS_RESOURCEINFO');
  END;
END IF;
IF UPDATING THEN
  BEGIN
    select SYSDATE into modifyDate from dual;
    :new.UPDATETIME := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Update Trigger Operation in table SYS_RESOURCEINFO');
  END;
END IF;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Failed Other Trigger Operation in table SYS_RESOURCEINFO');
END;
/

prompt
prompt Creating trigger SYS_ROLE_T
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER SYS_ROLE_T
BEFORE DELETE OR INSERT OR UPDATE
ON SYS_ROLE
FOR EACH ROW
DECLARE
createDate    date;
modifyDate    date;
BEGIN
IF DELETING THEN
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Delete Trigger Operation in table SYS_ROLE');
  END;
END IF;
IF INSERTING THEN
  BEGIN
    select SYSDATE into createDate from dual;
    select SYSDATE into modifyDate from dual;
    :new.CREATETIME := createDate;
    :new.UPDATETIME := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Insert Trigger Operation in table SYS_ROLE');
  END;
END IF;
IF UPDATING THEN
  BEGIN
    select SYSDATE into modifyDate from dual;
    :new.UPDATETIME := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Update Trigger Operation in table SYS_ROLE');
  END;
END IF;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Failed Other Trigger Operation in table SYS_ROLE');
END;
/

prompt
prompt Creating trigger SYS_USER_T
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER SYS_USER_T
BEFORE DELETE OR INSERT OR UPDATE
ON SYS_USER
FOR EACH ROW
DECLARE
createDate    date;
modifyDate    date;
BEGIN
IF DELETING THEN
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Delete Trigger Operation in table SYS_USER');
  END;
END IF;
IF INSERTING THEN
  BEGIN
    select SYSDATE into createDate from dual;
    select SYSDATE into modifyDate from dual;
    :new.CREATETIME := createDate;
    :new.UPDATETIME := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Insert Trigger Operation in table SYS_USER');
  END;
END IF;
IF UPDATING THEN
  BEGIN
    select SYSDATE into modifyDate from dual;
    :new.UPDATETIME := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Update Trigger Operation in table SYS_USER');
  END;
END IF;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Failed Other Trigger Operation in table SYS_USER');
END;
/

prompt
prompt Creating trigger TECHNOLOGICALPROCESS_T
prompt =======================================
prompt
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
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into createDate from dual;
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into modifyDate from dual;
    :new.CREATETIME := createDate;
    :new.UPDATETIME := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Insert Trigger Operation in table T_TECHNOLOGICALPROCESS');
  END;
END IF;
IF UPDATING THEN
  BEGIN
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into modifyDate from dual;
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
/


prompt
prompt Creating trigger ENTRY_PROCESS_T
prompt =======================================
prompt
CREATE OR REPLACE TRIGGER ENTRY_PROCESS_T
BEFORE DELETE OR INSERT OR UPDATE
ON T_ENTRY_PROCESS
FOR EACH ROW
DECLARE
createDate    varchar2(20);
modifyDate    varchar2(20);
BEGIN
IF DELETING THEN
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Delete Trigger Operation in table T_ENTRY_PROCESS');
  END;
END IF;
IF INSERTING THEN
  BEGIN
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into createDate from dual;
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into modifyDate from dual;
    :new.CREATETIME := createDate;
    :new.UPDATETIME := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Insert Trigger Operation in table T_ENTRY_PROCESS');
  END;
END IF;
IF UPDATING THEN
  BEGIN
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into modifyDate from dual;
    :new.UPDATETIME := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Update Trigger Operation in table T_ENTRY_PROCESS');
  END;
END IF;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Failed Other Trigger Operation in table T_ENTRY_PROCESS');
END;
/

prompt
prompt Creating trigger TRAINCOURSE_T
prompt ==============================
prompt
CREATE OR REPLACE TRIGGER TRAINCOURSE_T
BEFORE DELETE OR INSERT OR UPDATE
ON T_TRAINCOURSE
FOR EACH ROW
DECLARE
createDate    varchar2(20);
modifyDate    varchar2(20);
BEGIN
IF DELETING THEN
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Delete Trigger Operation in table T_TRAINCOURSE');
  END;
END IF;
IF INSERTING THEN
  BEGIN
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into createDate from dual;
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into modifyDate from dual;
    :new.CREATEDATE := createDate;
    :new.UPDATEDATE := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Insert Trigger Operation in table T_TRAINCOURSE');
  END;
END IF;
IF UPDATING THEN
  BEGIN
    select TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') into modifyDate from dual;
    :new.UPDATEDATE := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Update Trigger Operation in table T_TRAINCOURSE');
  END;
END IF;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Failed Other Trigger Operation in table T_TRAINCOURSE');
END;
/

prompt
prompt Creating trigger PERSONNEL_T
prompt ==============================
prompt
CREATE OR REPLACE TRIGGER T_PERSONNEL_T
BEFORE DELETE OR INSERT OR UPDATE
ON T_PERSONNEL
FOR EACH ROW
DECLARE
createDate    date;
modifyDate    date;
BEGIN
IF DELETING THEN
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Delete Trigger Operation in table T_PERSONNEL');
  END;
END IF;
IF INSERTING THEN
  BEGIN
    select SYSDATE into createDate from dual;
    select SYSDATE into modifyDate from dual;
    :new.CREATETIME := createDate;
    :new.UPDATETIME := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Insert Trigger Operation in table T_PERSONNEL');
  END;
END IF;
IF UPDATING THEN
  BEGIN
    select SYSDATE into modifyDate from dual;
    :new.UPDATETIME := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Update Trigger Operation in table T_PERSONNEL');
  END;
END IF;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Failed Other Trigger Operation in table T_PERSONNEL');
END;
/

prompt
prompt Creating trigger SYS_NOTICE_T
prompt ==============================
prompt
CREATE OR REPLACE TRIGGER SYS_NOTICE_T
BEFORE DELETE OR INSERT OR UPDATE
ON SYS_NOTICE
FOR EACH ROW
DECLARE
createDate    date;
modifyDate    date;
BEGIN
IF DELETING THEN
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Delete Trigger Operation in table SYS_NOTICE');
  END;
END IF;
IF INSERTING THEN
  BEGIN
    select SYSDATE into createDate from dual;
    select SYSDATE into modifyDate from dual;
    :new.CREATEDATE := createDate;
    :new.UPDATEDATE := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Insert Trigger Operation in table SYS_NOTICE');
  END;
END IF;
IF UPDATING THEN
  BEGIN
    select SYSDATE into modifyDate from dual;
    :new.UPDATEDATE := modifyDate;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Failed Update Trigger Operation in table SYS_NOTICE');
  END;
END IF;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Failed Other Trigger Operation in table SYS_NOTICE');
END;
/


spool off
