/*
 Navicat PostgreSQL Data Transfer

 Source Server         : 10.50.208.18-nacos
 Source Server Type    : PostgreSQL
 Source Server Version : 130000 (130000)
 Source Host           : 10.50.208.18:9006
 Source Catalog        : nacos
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 130000 (130000)
 File Encoding         : 65001

 Date: 14/04/2023 10:13:56
*/


-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."config_info";
CREATE TABLE "public"."config_info" (

)
TABLESPACE "pg_default"
;
COMMENT ON TABLE "public"."config_info" IS 'config_info';

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS "public"."config_info_aggr";
CREATE TABLE "public"."config_info_aggr" (

)
TABLESPACE "pg_default"
;
COMMENT ON TABLE "public"."config_info_aggr" IS '增加租户字段';

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS "public"."config_info_beta";
CREATE TABLE "public"."config_info_beta" (

)
TABLESPACE "pg_default"
;
COMMENT ON TABLE "public"."config_info_beta" IS 'config_info_beta';

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS "public"."config_info_tag";
CREATE TABLE "public"."config_info_tag" (

)
TABLESPACE "pg_default"
;
COMMENT ON TABLE "public"."config_info_tag" IS 'config_info_tag';

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS "public"."config_tags_relation";
CREATE TABLE "public"."config_tags_relation" (

)
TABLESPACE "pg_default"
;
COMMENT ON TABLE "public"."config_tags_relation" IS 'config_tag_relation';

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS "public"."group_capacity";
CREATE TABLE "public"."group_capacity" (

)
TABLESPACE "pg_default"
;
COMMENT ON TABLE "public"."group_capacity" IS '集群、各Group容量信息表';

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."his_config_info";
CREATE TABLE "public"."his_config_info" (

)
TABLESPACE "pg_default"
;
COMMENT ON TABLE "public"."his_config_info" IS '多租户改造';

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."permissions";
CREATE TABLE "public"."permissions" (

)
TABLESPACE "pg_default"
;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS "public"."roles";
CREATE TABLE "public"."roles" (

)
TABLESPACE "pg_default"
;

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS "public"."tenant_capacity";
CREATE TABLE "public"."tenant_capacity" (

)
TABLESPACE "pg_default"
;
COMMENT ON TABLE "public"."tenant_capacity" IS '租户容量信息表';

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."tenant_info";
CREATE TABLE "public"."tenant_info" (

)
TABLESPACE "pg_default"
;
COMMENT ON TABLE "public"."tenant_info" IS 'tenant_info';

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (

)
TABLESPACE "pg_default"
;

-- ----------------------------
-- Uniques structure for table config_info
-- ----------------------------
ALTER TABLE "public"."config_info" ADD CONSTRAINT "uk_configinfo_datagrouptenant"  USING INDEX TABLESPACE "pg_default";

-- ----------------------------
-- Primary Key structure for table config_info
-- ----------------------------

-- ----------------------------
-- Uniques structure for table config_info_aggr
-- ----------------------------
ALTER TABLE "public"."config_info_aggr" ADD CONSTRAINT "uk_configinfoaggr_datagrouptenantdatum"  USING INDEX TABLESPACE "pg_default";

-- ----------------------------
-- Primary Key structure for table config_info_aggr
-- ----------------------------

-- ----------------------------
-- Uniques structure for table config_info_beta
-- ----------------------------
ALTER TABLE "public"."config_info_beta" ADD CONSTRAINT "uk_configinfobeta_datagrouptenant"  USING INDEX TABLESPACE "pg_default";

-- ----------------------------
-- Primary Key structure for table config_info_beta
-- ----------------------------

-- ----------------------------
-- Uniques structure for table config_info_tag
-- ----------------------------
ALTER TABLE "public"."config_info_tag" ADD CONSTRAINT "uk_configinfotag_datagrouptenanttag"  USING INDEX TABLESPACE "pg_default";

-- ----------------------------
-- Primary Key structure for table config_info_tag
-- ----------------------------

-- ----------------------------
-- Uniques structure for table config_tags_relation
-- ----------------------------
ALTER TABLE "public"."config_tags_relation" ADD CONSTRAINT "uk_configtagrelation_configidtag"  USING INDEX TABLESPACE "pg_default";

-- ----------------------------
-- Primary Key structure for table config_tags_relation
-- ----------------------------

-- ----------------------------
-- Uniques structure for table group_capacity
-- ----------------------------
ALTER TABLE "public"."group_capacity" ADD CONSTRAINT "uk_group_id"  USING INDEX TABLESPACE "pg_default";

-- ----------------------------
-- Primary Key structure for table group_capacity
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table his_config_info
-- ----------------------------

-- ----------------------------
-- Uniques structure for table permissions
-- ----------------------------
ALTER TABLE "public"."permissions" ADD CONSTRAINT "uk_role_permission"  USING INDEX TABLESPACE "pg_default";

-- ----------------------------
-- Primary Key structure for table permissions
-- ----------------------------

-- ----------------------------
-- Uniques structure for table roles
-- ----------------------------
ALTER TABLE "public"."roles" ADD CONSTRAINT "uk_username_role"  USING INDEX TABLESPACE "pg_default";

-- ----------------------------
-- Primary Key structure for table roles
-- ----------------------------

-- ----------------------------
-- Uniques structure for table tenant_capacity
-- ----------------------------
ALTER TABLE "public"."tenant_capacity" ADD CONSTRAINT "uk_tenant_id"  USING INDEX TABLESPACE "pg_default";

-- ----------------------------
-- Primary Key structure for table tenant_capacity
-- ----------------------------

-- ----------------------------
-- Uniques structure for table tenant_info
-- ----------------------------
ALTER TABLE "public"."tenant_info" ADD CONSTRAINT "uk_tenant_info_kptenantid"  USING INDEX TABLESPACE "pg_default";

-- ----------------------------
-- Primary Key structure for table tenant_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
