/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/4/23 0:10:50                            */
/*==============================================================*/


drop table if exists ess_degree_code;

drop table if exists ess_department_code;

drop table if exists ess_enterprise;

drop table if exists ess_enterprise_mentor;

drop table if exists ess_enterprise_post;

drop table if exists ess_group;

drop table if exists ess_highest_education_code;

drop table if exists ess_prof_title_code;

drop table if exists ess_rule;

drop table if exists ess_school_code;

drop table if exists ess_student;

drop table if exists ess_teacher;

drop table if exists ess_uf_review_record;

drop table if exists ess_uf_update_record;

drop table if exists ess_ugp;

drop table if exists ess_ugp_component_score;

drop table if exists ess_ugp_excecution_mode_code;

drop table if exists ess_ugp_excecution_phase_code;

drop table if exists ess_ugp_notice;

drop table if exists ess_ugp_score_component_code;

drop table if exists ess_ugp_uf_categary;

drop table if exists ess_ugp_uploaded_file;

drop table if exists ess_user;

drop table if exists group_rule2;

drop table if exists user_group2;

drop table if exists user_rule2;

/*==============================================================*/
/* Table: ess_degree_code                                       */
/*==============================================================*/
create table ess_degree_code
(
   deg_id               int not null,
   deg_name             varchar(32) not null,
   primary key (deg_id)
);

/*==============================================================*/
/* Table: ess_department_code                                   */
/*==============================================================*/
create table ess_department_code
(
   dep_id               int not null,
   sch_id               int not null,
   dep_name             varchar(32) not null,
   dep_notes            varchar(255),
   primary key (dep_id)
);

/*==============================================================*/
/* Table: ess_enterprise                                        */
/*==============================================================*/
create table ess_enterprise
(
   entpr_id             int not null,
   entpr_name           varchar(64),
   entpr_desp           text,
   entpr_address        varchar(128),
   entpr_tel            bigint,
   entpr_email          varchar(32),
   entpr_contact        varchar(64),
   entpr_contact_mobile bigint,
   entpr_contact_email  varchar(32),
   entpr_notes          varchar(255),
   primary key (entpr_id)
);

/*==============================================================*/
/* Table: ess_enterprise_mentor                                 */
/*==============================================================*/
create table ess_enterprise_mentor
(
   em_id                bigint not null,
   entpr_id             int not null,
   pt_id                int not null,
   deg_id               int not null,
   he_id                int not null,
   em_name              varchar(32),
   em_gender            bool,
   em_tel               bigint,
   em_mobile            bigint,
   em_email             varchar(32),
   em_qq                bigint,
   primary key (em_id)
);

/*==============================================================*/
/* Table: ess_enterprise_post                                   */
/*==============================================================*/
create table ess_enterprise_post
(
   ep_id                int not null,
   entpr_id             int not null,
   ep_name              varchar(64),
   ep_duty              varchar(64),
   ep_requirement       varchar(64),
   ep_notes             varchar(64),
   primary key (ep_id)
);

/*==============================================================*/
/* Table: ess_group                                             */
/*==============================================================*/
create table ess_group
(
   group_id             int not null,
   group_name           varchar(32),
   group_notes          varchar(16),
   primary key (group_id)
);

/*==============================================================*/
/* Table: ess_highest_education_code                            */
/*==============================================================*/
create table ess_highest_education_code
(
   he_id                int not null,
   he_name              varchar(64) not null,
   primary key (he_id)
);

/*==============================================================*/
/* Table: ess_prof_title_code                                   */
/*==============================================================*/
create table ess_prof_title_code
(
   pt_id                int not null,
   pt_name              varchar(32),
   primary key (pt_id)
);

/*==============================================================*/
/* Table: ess_rule                                              */
/*==============================================================*/
create table ess_rule
(
   rule_id              int not null,
   rule_name            varchar(32),
   rule_notes           varchar(16),
   primary key (rule_id)
);

/*==============================================================*/
/* Table: ess_school_code                                       */
/*==============================================================*/
create table ess_school_code
(
   sch_id               int not null,
   sch_name             varchar(32) not null,
   sch_notes            varchar(255),
   primary key (sch_id)
);

/*==============================================================*/
/* Table: ess_student                                           */
/*==============================================================*/
create table ess_student
(
   stu_id               bigint not null,
   he_id                int not null,
   stu_class_id         bigint not null,
   stu_name             varchar(64) not null,
   stu_eng_name         varchar(32),
   stu_gender           bool,
   stu_grade            int,
   stu_schooloing_length smallint,
   stu_major            int,
   stu_entr_time        date,
   stu_grad_time        date,
   stu_is_fulltime      smallint,
   stu_is_dropping_out  bool,
   stu_is_quitting      bool,
   stu_campus_id        smallint,
   stu_mobile           bigint,
   stu_email            varchar(64),
   stu_qq               bigint,
   stu_notes            varchar(255),
   primary key (stu_id)
);

/*==============================================================*/
/* Table: ess_teacher                                           */
/*==============================================================*/
create table ess_teacher
(
   tch_id               bigint not null,
   he_id                int not null,
   deg_id               int not null,
   pt_id                int not null,
   sch_id               int not null,
   dep_id               int not null,
   tch_name             varchar(32) not null,
   tch_gender           bool,
   tch_position         varchar(32),
   tch_office_phone     bigint,
   tch_mobile           bigint,
   tch_email            varchar(32),
   tch_qq               bigint,
   tch_notes            varchar(255),
   primary key (tch_id)
);

/*==============================================================*/
/* Table: ess_uf_review_record                                  */
/*==============================================================*/
create table ess_uf_review_record
(
   urr_id               bigint not null,
   uuf_id               bigint not null,
   urr_file_id          bigint not null,
   urr_reviewer_id      bigint not null,
   urr_update_time      timestamp,
   urr_status           smallint,
   urr_comments         varchar(255),
   primary key (urr_id)
);

/*==============================================================*/
/* Table: ess_uf_update_record                                  */
/*==============================================================*/
create table ess_uf_update_record
(
   uur_id               int not null,
   uuf_id               bigint not null,
   uur_file_id          bigint not null,
   uur_update_time      datetime not null,
   uur_notes            longtext,
   primary key (uur_id)
);

/*==============================================================*/
/* Table: ess_ugp                                               */
/*==============================================================*/
create table ess_ugp
(
   ugp_stu_id           bigint not null,
   tch_id               bigint,
   em_id                bigint not null,
   entpr_id             int not null,
   ugp_type             smallint,
   ugp_thesis_title     varchar(64),
   ugp_thesis_abstract  text,
   ugp_sche_tasks       text,
   ugp_expe_outcomes    text,
   ugp_excecution_phase_id smallint,
   primary key (ugp_stu_id)
);

/*==============================================================*/
/* Table: ess_ugp_component_score                               */
/*==============================================================*/
create table ess_ugp_component_score
(
   ucs_stu_id           bigint not null,
   usc_id               int not null,
   ufc_id               int,
   ucs_component_score  smallint,
   primary key (ucs_stu_id)
);

/*==============================================================*/
/* Table: ess_ugp_excecution_mode_code                          */
/*==============================================================*/
create table ess_ugp_excecution_mode_code
(
   uem_id               int not null,
   uem_name             varchar(64) not null,
   uem_description      varchar(255),
   primary key (uem_id)
);

/*==============================================================*/
/* Table: ess_ugp_excecution_phase_code                         */
/*==============================================================*/
create table ess_ugp_excecution_phase_code
(
   uep_id               int not null,
   uep_name             varchar(64),
   uep_description      varchar(255),
   primary key (uep_id)
);

/*==============================================================*/
/* Table: ess_ugp_notice                                        */
/*==============================================================*/
create table ess_ugp_notice
(
   notice_id            bigint not null,
   user_id              bigint not null,
   notice_subject       varchar(64),
   notice_content       text,
   notice_user_id       bigint,
   notice_update_time   timestamp,
   primary key (notice_id)
);

/*==============================================================*/
/* Table: ess_ugp_score_component_code                          */
/*==============================================================*/
create table ess_ugp_score_component_code
(
   usc_id               int not null,
   ufc_id               int,
   usc_name             varchar(64),
   usc_max_score        smallint,
   primary key (usc_id)
);

/*==============================================================*/
/* Table: ess_ugp_uf_categary                                   */
/*==============================================================*/
create table ess_ugp_uf_categary
(
   ufc_id               int not null,
   uem_id               int,
   uep_id               int,
   ufc_name             varchar(64),
   ufc_suffix           varchar(32),
   ufc_max_size         bigint,
   ufc_require_score    bool,
   ufc_require_paper_doc bool,
   ufc_notes            bigint,
   primary key (ufc_id)
);

/*==============================================================*/
/* Table: ess_ugp_uploaded_file                                 */
/*==============================================================*/
create table ess_ugp_uploaded_file
(
   uuf_id               bigint not null,
   ufc_id               int not null,
   urr_id               bigint,
   uur_id               int,
   uuf_user_id          bigint,
   uuf_name             text,
   uuf_path             varchar(64),
   uuf_is_paper_doc_submited bool,
   uuf_last_update_record_id timestamp,
   uuf_last_review_record_id bigint,
   primary key (uuf_id)
);

/*==============================================================*/
/* Table: ess_user                                              */
/*==============================================================*/
create table ess_user
(
   user_id              bigint not null,
   user_name            varchar(64) not null,
   user_pwd             varchar(16),
   primary key (user_id)
);

/*==============================================================*/
/* Table: group_rule2                                           */
/*==============================================================*/
create table group_rule2
(
   rule_id              int not null,
   group_id             int not null,
   primary key (rule_id, group_id)
);

/*==============================================================*/
/* Table: user_group2                                           */
/*==============================================================*/
create table user_group2
(
   group_id             int not null,
   user_id              bigint not null,
   primary key (group_id, user_id)
);

/*==============================================================*/
/* Table: user_rule2                                            */
/*==============================================================*/
create table user_rule2
(
   rule_id              int not null,
   user_id              bigint not null,
   primary key (rule_id, user_id)
);

alter table ess_department_code add constraint FK_sch_dep foreign key (sch_id)
      references ess_school_code (sch_id) on delete restrict on update restrict;

alter table ess_enterprise_mentor add constraint FK_em_deg foreign key (deg_id)
      references ess_degree_code (deg_id) on delete restrict on update restrict;

alter table ess_enterprise_mentor add constraint FK_em_he foreign key (he_id)
      references ess_highest_education_code (he_id) on delete restrict on update restrict;

alter table ess_enterprise_mentor add constraint FK_em_pt foreign key (pt_id)
      references ess_prof_title_code (pt_id) on delete restrict on update restrict;

alter table ess_enterprise_mentor add constraint FK_entpr_em foreign key (entpr_id)
      references ess_enterprise (entpr_id) on delete restrict on update restrict;

alter table ess_enterprise_post add constraint FK_enptr_post foreign key (entpr_id)
      references ess_enterprise (entpr_id) on delete restrict on update restrict;

alter table ess_student add constraint FK_stu_he foreign key (he_id)
      references ess_highest_education_code (he_id) on delete restrict on update restrict;

alter table ess_teacher add constraint FK_tch_deg foreign key (deg_id)
      references ess_degree_code (deg_id) on delete restrict on update restrict;

alter table ess_teacher add constraint FK_tch_dep foreign key (dep_id)
      references ess_department_code (dep_id) on delete restrict on update restrict;

alter table ess_teacher add constraint FK_tch_he foreign key (he_id)
      references ess_highest_education_code (he_id) on delete restrict on update restrict;

alter table ess_teacher add constraint FK_tch_pt foreign key (pt_id)
      references ess_prof_title_code (pt_id) on delete restrict on update restrict;

alter table ess_teacher add constraint FK_tch_sch foreign key (sch_id)
      references ess_school_code (sch_id) on delete restrict on update restrict;

alter table ess_uf_review_record add constraint FK_urr_uuf2 foreign key (uuf_id)
      references ess_ugp_uploaded_file (uuf_id) on delete restrict on update restrict;

alter table ess_uf_update_record add constraint FK_uur_uuf3 foreign key (uuf_id)
      references ess_ugp_uploaded_file (uuf_id) on delete restrict on update restrict;

alter table ess_ugp add constraint FK_ugp_em foreign key (em_id)
      references ess_enterprise_mentor (em_id) on delete restrict on update restrict;

alter table ess_ugp add constraint FK_ugp_entpr foreign key (entpr_id)
      references ess_enterprise (entpr_id) on delete restrict on update restrict;

alter table ess_ugp add constraint FK_ugp_tch foreign key (tch_id)
      references ess_teacher (tch_id) on delete restrict on update restrict;

alter table ess_ugp_component_score add constraint FK_ucs_usc2 foreign key (usc_id)
      references ess_ugp_score_component_code (usc_id) on delete restrict on update restrict;

alter table ess_ugp_component_score add constraint FK_ucs_uuc2 foreign key (ufc_id)
      references ess_ugp_uf_categary (ufc_id) on delete restrict on update restrict;

alter table ess_ugp_notice add constraint FK_user_notice foreign key (user_id)
      references ess_user (user_id) on delete restrict on update restrict;

alter table ess_ugp_score_component_code add constraint FK_usc_uuc2 foreign key (ufc_id)
      references ess_ugp_uf_categary (ufc_id) on delete restrict on update restrict;

alter table ess_ugp_uf_categary add constraint FK_ufc_uem2 foreign key (uem_id)
      references ess_ugp_excecution_mode_code (uem_id) on delete restrict on update restrict;

alter table ess_ugp_uf_categary add constraint FK_ufc_uep2 foreign key (uep_id)
      references ess_ugp_excecution_phase_code (uep_id) on delete restrict on update restrict;

alter table ess_ugp_uploaded_file add constraint FK_urr_uuf3 foreign key (urr_id)
      references ess_uf_review_record (urr_id) on delete restrict on update restrict;

alter table ess_ugp_uploaded_file add constraint FK_uuf_ufc2 foreign key (ufc_id)
      references ess_ugp_uf_categary (ufc_id) on delete restrict on update restrict;

alter table ess_ugp_uploaded_file add constraint FK_uur_uuf2 foreign key (uur_id)
      references ess_uf_update_record (uur_id) on delete restrict on update restrict;

alter table group_rule2 add constraint FK_group_rule2 foreign key (rule_id)
      references ess_rule (rule_id) on delete restrict on update restrict;

alter table group_rule2 add constraint FK_group_rule3 foreign key (group_id)
      references ess_group (group_id) on delete restrict on update restrict;

alter table user_group2 add constraint FK_user_group2 foreign key (group_id)
      references ess_group (group_id) on delete restrict on update restrict;

alter table user_group2 add constraint FK_user_group3 foreign key (user_id)
      references ess_user (user_id) on delete restrict on update restrict;

alter table user_rule2 add constraint FK_user_rule2 foreign key (rule_id)
      references ess_rule (rule_id) on delete restrict on update restrict;

alter table user_rule2 add constraint FK_user_rule3 foreign key (user_id)
      references ess_user (user_id) on delete restrict on update restrict;

