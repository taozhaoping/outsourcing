
--sys_menu
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (40, '备忘录', 'memorandum', null, null, '0', 0, 4, null);
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (41, '记录维护', 'contactrecord', 'contactrecord.jspa', null, '0', 40, 1, 'staffAdmin');
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (43, '加盟商记录维护', 'franchiseerecord', 'franchiseerecord.jspa', null, '0', 40, 3, 'staffAdmin');
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (44, '加盟商记录查看', 'franchiseequeryrecord', 'franchiseequeryrecord.jspa', null, '0', 40, 4, 'staffAdmin');
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (1, '系统配置', 'sysConfig', null, null, '0', 0, 1, null);
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (3, '用户列表', 'userInfo', 'userInfo.jspa', null, '0', 1, 2, 'home');
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (4, '参数配置', 'param', 'param.jspa', null, '0', 1, 3, 'home');
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (5, '角色列表', 'role', 'role.jspa', null, '0', 1, 4, 'home');
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (10, '外教管理', 'staff', null, null, '0', 0, 2, 'staffAdmin');
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (11, '活动管理', 'activities', 'activities.jspa', null, '0', 10, 1, 'staffAdmin');
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (12, '培训管理', 'train', 'train.jspa', null, '0', 10, 2, 'staffAdmin');
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (20, '流程管理', 'workflow', null, null, '0', 0, 3, null);
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (21, '外教入职流程', 'induction', 'induction.jspa', null, '0', 20, 1, 'workflow');
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (22, '外教招聘流程', 'recruitment', 'recruitment.jspa', null, '0', 20, 2, 'workflow');
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (13, '花名册', 'roster', 'roster.jspa', null, '0', 10, 3, 'staffAdmin');
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (14, '洽谈维护', 'negotiate', 'negotiate.jspa', null, '0', 10, 4, 'staffAdmin');
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (23, '证件变更流程', 'documentchange', 'documentchange.jspa', null, '0', 20, 3, 'workflow');
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (50, '加盟商管理', 'franchiseemaintain', null, null, '0', 0, 5, null);
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (51, '加盟商维护', 'franchisee', 'franchisee.jspa', null, '0', 50, 1, 'staffAdmin');
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (24, '加盟申请流程', 'applyfranchisee', 'applyfranchisee.jspa', null, '0', 20, 4, 'workflow');
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (15, '外派记录', 'assignment', 'assignment.jspa', null, '0', 10, 5, 'staffAdmin');
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (25, '外派申请流程', 'applyassignment', 'applyassignment.jspa', null, '0', 20, 5, null);
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (2, '企业列表', 'enterprise', 'enterprise.jspa', null, '0', 1, 1, 'home');
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (30, '系统公告', 'notice', 'notice.jspa', null, '0', 1, 5, 'home');
--
--insert into SYS_MENU (ID, NAME, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER, NAMESPACE)
--values (42, '记录查看', 'queryrecord', 'queryrecord.jspa', null, '0', 40, 2, 'staffAdmin');


insert into SYS_MENU (ID, NAME, NAMESPACE, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER)
values (40, '备忘录', null, 'memorandum', null, null, '0', 0, 4);

insert into SYS_MENU (ID, NAME, NAMESPACE, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER)
values (41, '记录维护', 'staffAdmin', 'contactrecord', 'contactrecord.jspa', null, '0', 40, 1);

insert into SYS_MENU (ID, NAME, NAMESPACE, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER)
values (43, '加盟商记录维护', 'staffAdmin', 'franchiseerecord', 'franchiseerecord.jspa', null, '0', 40, 3);

insert into SYS_MENU (ID, NAME, NAMESPACE, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER)
values (44, '加盟商记录查看', 'staffAdmin', 'franchiseequeryrecord', 'franchiseequeryrecord.jspa', null, '0', 40, 4);

insert into SYS_MENU (ID, NAME, NAMESPACE, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER)
values (1, '系统配置', null, 'sysConfig', null, null, '0', 0, 1);

insert into SYS_MENU (ID, NAME, NAMESPACE, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER)
values (3, '用户列表', 'home', 'userInfo', 'userInfo.jspa', null, '0', 1, 2);

insert into SYS_MENU (ID, NAME, NAMESPACE, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER)
values (4, '参数配置', 'home', 'param', 'param.jspa', null, '0', 1, 3);

insert into SYS_MENU (ID, NAME, NAMESPACE, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER)
values (5, '角色列表', 'home', 'role', 'role.jspa', null, '0', 1, 4);

insert into SYS_MENU (ID, NAME, NAMESPACE, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER)
values (20, '流程管理', null, 'workflow', null, null, '0', 0, 3);

insert into SYS_MENU (ID, NAME, NAMESPACE, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER)
values (22, '外教招聘流程', 'workflow', 'recruitment', 'recruitment.jspa', null, '0', 20, 2);

insert into SYS_MENU (ID, NAME, NAMESPACE, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER)
values (50, '加盟商管理', null, 'franchiseemaintain', null, null, '0', 0, 5);

insert into SYS_MENU (ID, NAME, NAMESPACE, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER)
values (51, '加盟商维护', 'staffAdmin', 'franchisee', 'franchisee.jspa', null, '0', 50, 1);

insert into SYS_MENU (ID, NAME, NAMESPACE, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER)
values (24, '加盟申请流程', 'workflow', 'applyfranchisee', 'applyfranchisee.jspa', null, '0', 20, 4);

insert into SYS_MENU (ID, NAME, NAMESPACE, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER)
values (2, '企业列表', 'home', 'enterprise', 'enterprise.jspa', null, '0', 1, 1);

insert into SYS_MENU (ID, NAME, NAMESPACE, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER)
values (30, '系统公告', 'home', 'notice', 'notice.jspa', null, '0', 1, 5);

insert into SYS_MENU (ID, NAME, NAMESPACE, ACTION, URL, I18N_KEY, ENABLED, PARENTID, REORDER)
values (42, '记录查看', 'staffAdmin', 'queryrecord', 'queryrecord.jspa', null, '0', 40, 2);



insert into SYS_AUTHORITIES (ID, NAME, ENABLED, MODULE)
values (1, '测试', 0, 'main');

insert into SYS_AUTHORITIES (ID, NAME, ENABLED, MODULE)
values (2, 'p3p', 0, 'main');

insert into SYS_AUTHORITIES (ID, NAME, ENABLED, MODULE)
values (3, 'gag', 0, 'main');

insert into SYS_AUTHORITIES (ID, NAME, ENABLED, MODULE)
values (4, '测试3', 0, 'main');

insert into SYS_AUTHORITIES (ID, NAME, ENABLED, MODULE)
values (5, '测试5', 0, 'main');

insert into SYS_AUTHORITIES (ID, NAME, ENABLED, MODULE)
values (6, '测试6', 0, 'main');


insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (44, 5);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (20, 5);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (24, 5);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (50, 5);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (51, 5);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (40, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (41, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (40, 2);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (41, 2);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (21, 2);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (22, 2);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (40, 4);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (43, 4);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (20, 4);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (24, 4);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (50, 4);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (51, 4);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (40, 5);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (43, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (44, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (42, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (30, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (10, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (11, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (12, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (13, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (14, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (15, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (20, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (21, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (22, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (23, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (24, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (25, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (50, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (51, 6);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (40, 3);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (41, 3);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (42, 3);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (1, 3);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (30, 3);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (20, 3);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (21, 3);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (22, 3);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (41, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (43, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (44, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (42, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (1, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (3, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (4, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (5, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (2, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (30, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (10, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (11, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (12, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (13, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (40, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (14, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (15, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (20, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (21, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (22, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (23, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (24, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (50, 1);

insert into SYS_ROLE_TO_MENU (MENU_ID, ROLE_ID)
values (51, 1);

--
insert into SYS_ROLE (ID, NAME, CREATETIME, UPDATETIME, DESCRIBE)
values (1, '超级管理员', to_date('10-07-2014', 'dd-mm-yyyy'), to_date('06-02-2015 10:53:25', 'dd-mm-yyyy hh24:mi:ss'), '超级管理员');

insert into SYS_ROLE (ID, NAME, CREATETIME, UPDATETIME, DESCRIBE)
values (2, '外教招聘专员', to_date('15-07-2014', 'dd-mm-yyyy'), to_date('12-02-2015 16:19:17', 'dd-mm-yyyy hh24:mi:ss'), '外教招聘专员');

insert into SYS_ROLE (ID, NAME, CREATETIME, UPDATETIME, DESCRIBE)
values (3, '外教招聘主管', to_date('15-07-2014', 'dd-mm-yyyy'), to_date('12-02-2015 16:22:15', 'dd-mm-yyyy hh24:mi:ss'), '外教招聘主管');

insert into SYS_ROLE (ID, NAME, CREATETIME, UPDATETIME, DESCRIBE)
values (4, '校园招聘专员', to_date('15-07-2014', 'dd-mm-yyyy'), to_date('12-02-2015 16:20:01', 'dd-mm-yyyy hh24:mi:ss'), '校园招聘专员');

insert into SYS_ROLE (ID, NAME, CREATETIME, UPDATETIME, DESCRIBE)
values (5, '校园招聘主管', to_date('15-07-2014', 'dd-mm-yyyy'), to_date('12-02-2015 16:20:40', 'dd-mm-yyyy hh24:mi:ss'), '校园招聘主管');

insert into SYS_ROLE (ID, NAME, CREATETIME, UPDATETIME, DESCRIBE)
values (6, '外事办主管', to_date('15-07-2014', 'dd-mm-yyyy'), to_date('12-02-2015 16:21:31', 'dd-mm-yyyy hh24:mi:ss'), '外事办主管');

insert into SYS_ENTERPRISE (ID, NAME, ADDRESS, PHONECALL, ENABLED)
values (1, '外包企业', '外包企业', null, 0);


insert into SYS_USER (ID, LOGINNAME, USERPASSWORD, NAME, ENABLED, USERTYPE, ROLE_ID, ENTERPRISE_ID, EMAIL, AGE, SEX, PHONE, QQ, MOBILE_NUMBER, ENTRYTIME, ADDRESS, EDUCATION_BACKGROUND, CREATETIME, UPDATETIME, NONCE)
values (1, 'admin', '$2a$12$d4HH3RR2y9uYMbcXLcXMx.9prcpbjH65X7cnVUxcAbErCp3jPLP3m', '超级管理员', '0', '0', 1, 1, 'taozhaoping@gmail.com', to_date('21-11-2014', 'dd-mm-yyyy'), '1', '0577-67587398', '222924361', '18758084122', to_date('01-07-2014', 'dd-mm-yyyy'), '浙江大学家里蹲专业', '0', to_date('14-07-2014', 'dd-mm-yyyy'), to_date('27-02-2015 11:49:01', 'dd-mm-yyyy hh24:mi:ss'), 'E0wJwd0m2BhuaTzrKB0q+A==');

insert into SYS_USER (ID, LOGINNAME, USERPASSWORD, NAME, ENABLED, USERTYPE, ROLE_ID, ENTERPRISE_ID, EMAIL, AGE, SEX, PHONE, QQ, MOBILE_NUMBER, ENTRYTIME, ADDRESS, EDUCATION_BACKGROUND, CREATETIME, UPDATETIME, NONCE)
values (15, 'caiyingying', '$2a$12$pZ0sTnONlgDsKGBuNSOmM..x3rdRJx69PrqDNrUNX0bSQXX6BODeW', 'sd', '1', null, 17, 1, 'caiyingying@gmail.com', to_date('10-07-2014', 'dd-mm-yyyy'), '0', null, null, '18758087122', to_date('03-07-2014', 'dd-mm-yyyy'), null, '0', to_date('17-07-2014', 'dd-mm-yyyy'), to_date('01-09-2014 19:24:47', 'dd-mm-yyyy hh24:mi:ss'), null);

insert into SYS_USER (ID, LOGINNAME, USERPASSWORD, NAME, ENABLED, USERTYPE, ROLE_ID, ENTERPRISE_ID, EMAIL, AGE, SEX, PHONE, QQ, MOBILE_NUMBER, ENTRYTIME, ADDRESS, EDUCATION_BACKGROUND, CREATETIME, UPDATETIME, NONCE)
values (12, 'taozhaoping', '$2a$12$AJHnqyLxa/7bPObtQd384ucog9odagXkY5EW8kYPDPfodeD35PYRe', '陶照平', '0', null, 1, 1, 'taozhaoping@gmail.com', to_date('16-07-2014', 'dd-mm-yyyy'), '1', '112111', '1112312', '18758084122', to_date('24-07-2014', 'dd-mm-yyyy'), '1', '1', to_date('16-07-2014', 'dd-mm-yyyy'), to_date('19-12-2014 14:54:16', 'dd-mm-yyyy hh24:mi:ss'), null);

insert into SYS_RESOURCEINFO (ID, NAME, VALUE, TYPE, CREATETIME, UPDATETIME, ENABLED)
values (1, '男', '1', 'sex', to_date('16-07-2014', 'dd-mm-yyyy'), null, 0);

insert into SYS_RESOURCEINFO (ID, NAME, VALUE, TYPE, CREATETIME, UPDATETIME, ENABLED)
values (2, '女', '2', 'sex', to_date('16-07-2014', 'dd-mm-yyyy'), null, 0);

insert into SYS_RESOURCEINFO (ID, NAME, VALUE, TYPE, CREATETIME, UPDATETIME, ENABLED)
values (3, '大专', '1', 'education', null, null, 0);

insert into SYS_RESOURCEINFO (ID, NAME, VALUE, TYPE, CREATETIME, UPDATETIME, ENABLED)
values (4, '未知', '0', 'sex', to_date('16-07-2014', 'dd-mm-yyyy'), null, 0);

insert into SYS_PARAM (ID, EMAILSERVICE, EMAILFORM, EMAILUSERNAME, EMAILPASSWORD, EMAILISAUTH, EMAILURLPASSWORD)
values (1, 'smtp.163.com', 'noreplay101@163.com', 'noreplay101', '123qwe!@#', '0', null);