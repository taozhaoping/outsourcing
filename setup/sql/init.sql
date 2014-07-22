insert into SYS_MENU (id, name, action, url, i18n_key, enabled, parentid, reorder)
values (1, '系统配置', 'sysConfig', null, null, '0', 0, null);
insert into SYS_MENU (id, name, action, url, i18n_key, enabled, parentid, reorder)
values (3, '用户列表', 'userInfo', 'userInfo.jspa', null, '0', 1, 2);
insert into SYS_MENU (id, name, action, url, i18n_key, enabled, parentid, reorder)
values (4, '参数配置', 'param', 'param.jspa', null, '0', 1, 3);
insert into SYS_MENU (id, name, action, url, i18n_key, enabled, parentid, reorder)
values (5, '角色列表', 'role', 'role.jspa', null, '0', 1, 4);
insert into SYS_MENU (id, name, action, url, i18n_key, enabled, parentid, reorder)
values (10, '外教管理', '1', '1', null, '0', 0, null);
insert into SYS_MENU (id, name, action, url, i18n_key, enabled, parentid, reorder)
values (11, '资源录入', '2', '2', null, '0', 10, 1);
insert into SYS_MENU (id, name, action, url, i18n_key, enabled, parentid, reorder)
values (12, '资源分配', '3', '3', null, '0', 10, 2);
insert into SYS_MENU (id, name, action, url, i18n_key, enabled, parentid, reorder)
values (20, '客户管理', '4', '4', null, '0', 0, null);
insert into SYS_MENU (id, name, action, url, i18n_key, enabled, parentid, reorder)
values (21, '客户录入', '5', '5', null, '0', 20, 1);
insert into SYS_MENU (id, name, action, url, i18n_key, enabled, parentid, reorder)
values (22, '客户跟踪', '6', '6', null, '0', 20, 2);
insert into SYS_MENU (id, name, action, url, i18n_key, enabled, parentid, reorder)
values (2, '企业列表', 'enterprise', 'enterprise.jspa', null, '0', 1, 1);
commit;


insert into SYS_AUTHORITIES (id, name, enabled, module)
values (1, '测试', 0, 'main');
insert into SYS_AUTHORITIES (id, name, enabled, module)
values (2, 'p3p', 0, 'main');
insert into SYS_AUTHORITIES (id, name, enabled, module)
values (3, 'gag', 0, 'main');
insert into SYS_AUTHORITIES (id, name, enabled, module)
values (4, '测试3', 0, 'main');
insert into SYS_AUTHORITIES (id, name, enabled, module)
values (5, '测试5', 0, 'main');
insert into SYS_AUTHORITIES (id, name, enabled, module)
values (6, '测试6', 0, 'main');
commit;

insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (2, 4);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (2, 5);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (10, 1);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (10, 2);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (1, 1);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (1, 4);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (15, 4);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (4, 1);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (4, 4);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (15, 1);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (17, 4);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (17, 5);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (18, 1);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (18, 4);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (14, 1);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (14, 4);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (16, 1);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (3, 1);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (13, 1);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (13, 2);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (13, 3);
insert into SYS_ROLE_TO_AUTHORITIES (role_id, authorities_id)
values (7, 1);
commit;

insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (10, 13);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (11, 13);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (12, 13);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (20, 7);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (21, 7);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (22, 7);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (21, 15);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (1, 1);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (10, 1);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (20, 1);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (22, 15);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (10, 17);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (10, 4);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (20, 15);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (11, 17);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (12, 17);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (10, 18);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (11, 18);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (12, 18);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (20, 3);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (21, 3);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (22, 3);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (20, 14);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (21, 14);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (22, 14);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (20, 16);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (21, 16);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (22, 16);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (10, 2);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (11, 2);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (12, 2);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (20, 10);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (21, 10);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (22, 10);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (2, 1);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (3, 1);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (4, 1);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (5, 1);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (12, 1);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (11, 1);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (21, 1);
insert into SYS_ROLE_TO_MENU (menu_id, role_id)
values (22, 1);
commit;

insert into SYS_ROLE (id, name, createtime, updatetime, describe)
values (17, '测试角色1', to_date('17-07-2014', 'dd-mm-yyyy'), to_date('17-07-2014', 'dd-mm-yyyy'), '测试角色2');
insert into SYS_ROLE (id, name, createtime, updatetime, describe)
values (14, '新增1', null, to_date('17-07-2014', 'dd-mm-yyyy'), '新增1');
insert into SYS_ROLE (id, name, createtime, updatetime, describe)
values (15, '新增2', to_date('16-07-2014', 'dd-mm-yyyy'), to_date('16-07-2014', 'dd-mm-yyyy'), 'xinzeng2');
insert into SYS_ROLE (id, name, createtime, updatetime, describe)
values (18, '测试角色3', to_date('17-07-2014', 'dd-mm-yyyy'), null, '测试角色3');
insert into SYS_ROLE (id, name, createtime, updatetime, describe)
values (1, '超级管理员', to_date('10-07-2014', 'dd-mm-yyyy'), null, '超级管理员');
insert into SYS_ROLE (id, name, createtime, updatetime, describe)
values (2, '角色2', to_date('15-07-2014', 'dd-mm-yyyy'), null, '角色21');
insert into SYS_ROLE (id, name, createtime, updatetime, describe)
values (3, '角色3', to_date('15-07-2014', 'dd-mm-yyyy'), to_date('17-07-2014', 'dd-mm-yyyy'), '角色3');
insert into SYS_ROLE (id, name, createtime, updatetime, describe)
values (4, '角色4', to_date('15-07-2014', 'dd-mm-yyyy'), null, '角色4');
insert into SYS_ROLE (id, name, createtime, updatetime, describe)
values (5, '角色5', to_date('15-07-2014', 'dd-mm-yyyy'), null, '角色5');
insert into SYS_ROLE (id, name, createtime, updatetime, describe)
values (6, '角色6', to_date('15-07-2014', 'dd-mm-yyyy'), null, '角色6');
insert into SYS_ROLE (id, name, createtime, updatetime, describe)
values (7, '角色7', to_date('15-07-2014', 'dd-mm-yyyy'), to_date('17-07-2014', 'dd-mm-yyyy'), '角色7');
insert into SYS_ROLE (id, name, createtime, updatetime, describe)
values (8, '角色8', to_date('15-07-2014', 'dd-mm-yyyy'), null, '角色8');
insert into SYS_ROLE (id, name, createtime, updatetime, describe)
values (9, '角色9', to_date('15-07-2014', 'dd-mm-yyyy'), null, '角色9');
insert into SYS_ROLE (id, name, createtime, updatetime, describe)
values (10, '角色10', to_date('15-07-2014', 'dd-mm-yyyy'), null, '角色10');
insert into SYS_ROLE (id, name, createtime, updatetime, describe)
values (11, '角色11', to_date('15-07-2014', 'dd-mm-yyyy'), null, '角色11');
insert into SYS_ROLE (id, name, createtime, updatetime, describe)
values (12, '角色12', to_date('15-07-2014', 'dd-mm-yyyy'), null, '角色12');
insert into SYS_ROLE (id, name, createtime, updatetime, describe)
values (13, '角色13', to_date('15-07-2014', 'dd-mm-yyyy'), to_date('17-07-2014', 'dd-mm-yyyy'), '角色13');
insert into SYS_ROLE (id, name, createtime, updatetime, describe)
values (16, '新增3', to_date('16-07-2014', 'dd-mm-yyyy'), to_date('17-07-2014', 'dd-mm-yyyy'), '333');
commit;


insert into SYS_ENTERPRISE (id, name, address, phonecall, enabled)
values (18, '测试公司7', '测试公司71', null, 0);
insert into SYS_ENTERPRISE (id, name, address, phonecall, enabled)
values (14, '测试公司3', '测试公司3', null, 0);
insert into SYS_ENTERPRISE (id, name, address, phonecall, enabled)
values (16, '测试公司5', '测试公司5', null, 0);
insert into SYS_ENTERPRISE (id, name, address, phonecall, enabled)
values (12, '测试公司1', '测试公司1', null, 0);
insert into SYS_ENTERPRISE (id, name, address, phonecall, enabled)
values (13, '测试公司2', '测试公司2', null, 0);
insert into SYS_ENTERPRISE (id, name, address, phonecall, enabled)
values (15, '测试公司4', '测试公司4', null, 0);
insert into SYS_ENTERPRISE (id, name, address, phonecall, enabled)
values (17, '测试公司6', '测试公司6', null, 0);
insert into SYS_ENTERPRISE (id, name, address, phonecall, enabled)
values (21, '111', '111', '18758084122', 0);
insert into SYS_ENTERPRISE (id, name, address, phonecall, enabled)
values (1, '测试缓存', '测试地址', '电话', 0);
insert into SYS_ENTERPRISE (id, name, address, phonecall, enabled)
values (4, '测试企业', '测试地址', '88888888', 0);
insert into SYS_ENTERPRISE (id, name, address, phonecall, enabled)
values (5, '测试公司2', '测试公司2', null, 0);
insert into SYS_ENTERPRISE (id, name, address, phonecall, enabled)
values (6, '12', '12', '12', 0);
commit;


insert into SYS_USER (id, loginname, userpassword, name, enabled, usertype, role_id, enterprise_id, email, age, sex, phone, qq, mobile_number, entrytime, address, education_background, createtime, updatetime)
values (12, 'taozhaoping', '$2a$12$ITxFgPdEMngegUXaA.5CbedR.sLAtGf0Kj.31NVVeALULA3QkLZiu', '陶照平1', '0', null, 1, 18, 'taozhaoping@gmail.com', to_date('16-07-2014', 'dd-mm-yyyy'), '1', '11', '11', '18758084122', to_date('24-07-2014', 'dd-mm-yyyy'), '1', '1', to_date('16-07-2014', 'dd-mm-yyyy'), to_date('17-07-2014 17:12:45', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_USER (id, loginname, userpassword, name, enabled, usertype, role_id, enterprise_id, email, age, sex, phone, qq, mobile_number, entrytime, address, education_background, createtime, updatetime)
values (1, 'admin', '$2a$12$HE1p3lcWDgqT3MbCnt7qy.wefrXI5a9PThbHa266nZxJhZsEMKI.O', '超级管理员', '0', '0', 1, 1, 'taozhaoping@gmail.com', to_date('21-11-2014', 'dd-mm-yyyy'), '1', '0577-67587398', '222924361', '18758084122', to_date('01-07-2014', 'dd-mm-yyyy'), '浙江大学家里蹲专业', '1', to_date('14-07-2014', 'dd-mm-yyyy'), to_date('17-07-2014 15:43:49', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_USER (id, loginname, userpassword, name, enabled, usertype, role_id, enterprise_id, email, age, sex, phone, qq, mobile_number, entrytime, address, education_background, createtime, updatetime)
values (17, 'sdfs', '$2a$12$olAMnhb3xH55g7O7PKfDUO/2FjBdhBTYYIA7dTqoBLeqNVrnBL.NC', 'sdf', null, null, null, null, 'sdfs@gmail.com', to_date('10-07-2014', 'dd-mm-yyyy'), null, null, null, '18758084122', to_date('03-07-2014', 'dd-mm-yyyy'), null, null, to_date('17-07-2014', 'dd-mm-yyyy'), null);
insert into SYS_USER (id, loginname, userpassword, name, enabled, usertype, role_id, enterprise_id, email, age, sex, phone, qq, mobile_number, entrytime, address, education_background, createtime, updatetime)
values (15, 'caiyingying', '$2a$12$8tNbc1nnXXRE6KSKoXDbFOcYFe3rZ9m6bZU14UoPd/To2GcJGN5fC', 'sd', '1', null, null, null, 'caiyingying@gmail.com', to_date('10-07-2014', 'dd-mm-yyyy'), null, null, null, '18758087122', to_date('03-07-2014', 'dd-mm-yyyy'), null, null, to_date('17-07-2014', 'dd-mm-yyyy'), to_date('17-07-2014 19:59:27', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_USER (id, loginname, userpassword, name, enabled, usertype, role_id, enterprise_id, email, age, sex, phone, qq, mobile_number, entrytime, address, education_background, createtime, updatetime)
values (16, 'caca', '$2a$12$dArWACGkMFPS6v2SYDwKtuk8ww9Ujo9S4V4mdI4CDN13gcXxz90gi', '11', '1', null, null, null, '1wq@gmail.com', null, null, null, null, '18758084122', null, null, null, to_date('17-07-2014', 'dd-mm-yyyy'), to_date('17-07-2014 16:35:45', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_USER (id, loginname, userpassword, name, enabled, usertype, role_id, enterprise_id, email, age, sex, phone, qq, mobile_number, entrytime, address, education_background, createtime, updatetime)
values (18, 'cyy', '$2a$12$b4Mk4JojxzVUELMBw72TRe0lkimiBBKba0t2/fqDwy4pulNZpUvzy', '蔡迎迎', '0', null, 1, 18, 'caiyingying234@163.com', to_date('17-07-2014', 'dd-mm-yyyy'), '1', '01088888888', '88888888', '18888888888', to_date('17-07-2014', 'dd-mm-yyyy'), 'aaaa', '0', to_date('17-07-2014', 'dd-mm-yyyy'), to_date('17-07-2014 19:59:56', 'dd-mm-yyyy hh24:mi:ss'));
commit;


insert into SYS_RESOURCEINFO (id, name, value, type, createtime, updatetime, enabled)
values (1, '男', '1', 'sex', to_date('16-07-2014', 'dd-mm-yyyy'), null, 0);
insert into SYS_RESOURCEINFO (id, name, value, type, createtime, updatetime, enabled)
values (2, '女', '2', 'sex', to_date('16-07-2014', 'dd-mm-yyyy'), null, 0);
insert into SYS_RESOURCEINFO (id, name, value, type, createtime, updatetime, enabled)
values (3, '大专', '1', 'education', null, null, 0);
insert into SYS_RESOURCEINFO (id, name, value, type, createtime, updatetime, enabled)
values (4, '未知', '0', 'sex', to_date('16-07-2014', 'dd-mm-yyyy'), null, 0);
commit;

insert into SYS_PARAM (id, emailservice, emailform, emailusername, emailpassword, emailisauth, emailurlpassword)
values (1, 'smtp.163.com', 'noreplay101@163.com', 'noreplay101', '123qwe!@#', '0', '');
commit;