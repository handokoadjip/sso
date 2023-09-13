/*
 Navicat Premium Data Transfer

 Source Server         : DEV
 Source Server Type    : PostgreSQL
 Source Server Version : 140006
 Source Host           : localhost:5432
 Source Catalog        : sso
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140006
 File Encoding         : 65001

 Date: 13/09/2023 10:00:38
*/


-- ----------------------------
-- Sequence structure for failed_jobs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."failed_jobs_id_seq";
CREATE SEQUENCE "public"."failed_jobs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for migrations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."migrations_id_seq";
CREATE SEQUENCE "public"."migrations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for personal_access_tokens_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."personal_access_tokens_id_seq";
CREATE SEQUENCE "public"."personal_access_tokens_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for aksi
-- ----------------------------
DROP TABLE IF EXISTS "public"."aksi";
CREATE TABLE "public"."aksi" (
  "aksi_id" uuid NOT NULL,
  "aksi_menu_item_id" uuid NOT NULL,
  "aksi_label" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "aksi_tautan" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "aksi_dibuat_pada" timestamp(0),
  "aksi_diubah_pada" timestamp(0)
)
;

-- ----------------------------
-- Records of aksi
-- ----------------------------
INSERT INTO "public"."aksi" VALUES ('c2d1059b-2e40-4311-a3b1-245f001aec08', 'f220b842-d0b5-4c0d-9625-fff775e69762', 'Hak Akses', '/backoffice/grup/hak-akses', '2023-02-20 05:35:35', '2023-02-20 05:35:35');
INSERT INTO "public"."aksi" VALUES ('c9b32af3-40cd-4edf-82ea-4fd971fc7d1e', '3c3b17c2-9fc6-4613-a910-3c0160919fe4', 'Aksi', '/backoffice/grup/aksi', '2023-02-20 05:35:35', '2023-02-20 05:35:35');
INSERT INTO "public"."aksi" VALUES ('590f99a7-5b24-4900-a0cc-e6e771dfef6b', '75b20781-449f-4c1b-ad50-f13d2248ba81', 'Lihat', '/backoffice/pengguna/lihat', '2023-02-20 05:35:35', '2023-02-20 05:35:35');

-- ----------------------------
-- Table structure for aplikasi
-- ----------------------------
DROP TABLE IF EXISTS "public"."aplikasi";
CREATE TABLE "public"."aplikasi" (
  "aplikasi_id" uuid NOT NULL,
  "aplikasi_kategori_id" uuid NOT NULL,
  "aplikasi_nama" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "aplikasi_ikon" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "aplikasi_ikon_normal" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "aplikasi_tautan" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "aplikasi_jenis" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "aplikasi_dibuat_pada" timestamp(0),
  "aplikasi_diubah_pada" timestamp(0),
  "aplikasi_dibuat_pengguna_id" uuid NOT NULL
)
;
COMMENT ON COLUMN "public"."aplikasi"."aplikasi_jenis" IS 'utama | lainnya';

-- ----------------------------
-- Records of aplikasi
-- ----------------------------

-- ----------------------------
-- Table structure for crud
-- ----------------------------
DROP TABLE IF EXISTS "public"."crud";
CREATE TABLE "public"."crud" (
  "crud_id" uuid NOT NULL,
  "crud_nama" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "crud_foto" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default.jpg'::character varying,
  "crud_dibuat_pada" timestamp(0),
  "crud_diubah_pada" timestamp(0)
)
;

-- ----------------------------
-- Records of crud
-- ----------------------------

-- ----------------------------
-- Table structure for crud_one_to_many_fk
-- ----------------------------
DROP TABLE IF EXISTS "public"."crud_one_to_many_fk";
CREATE TABLE "public"."crud_one_to_many_fk" (
  "crud_one_to_many_fk_id" uuid NOT NULL,
  "crud_one_to_many_fk_crud_one_to_many_pk_id" uuid NOT NULL,
  "crud_one_to_many_fk_telp" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "crud_one_to_many_fk_dibuat_pada" timestamp(0),
  "crud_one_to_many_fk_diubah_pada" timestamp(0)
)
;

-- ----------------------------
-- Records of crud_one_to_many_fk
-- ----------------------------

-- ----------------------------
-- Table structure for crud_one_to_many_pk
-- ----------------------------
DROP TABLE IF EXISTS "public"."crud_one_to_many_pk";
CREATE TABLE "public"."crud_one_to_many_pk" (
  "crud_one_to_many_pk_id" uuid NOT NULL,
  "crud_one_to_many_pk_nama" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "crud_one_to_many_pk_dibuat_pada" timestamp(0),
  "crud_one_to_many_pk_diubah_pada" timestamp(0)
)
;

-- ----------------------------
-- Records of crud_one_to_many_pk
-- ----------------------------

-- ----------------------------
-- Table structure for crud_one_to_one_fk
-- ----------------------------
DROP TABLE IF EXISTS "public"."crud_one_to_one_fk";
CREATE TABLE "public"."crud_one_to_one_fk" (
  "crud_one_to_one_fk_id" uuid NOT NULL,
  "crud_one_to_one_fk_crud_one_to_one_pk_id" uuid NOT NULL,
  "crud_one_to_one_fk_telp" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "crud_one_to_one_fk_dibuat_pada" timestamp(0),
  "crud_one_to_one_fk_diubah_pada" timestamp(0)
)
;

-- ----------------------------
-- Records of crud_one_to_one_fk
-- ----------------------------

-- ----------------------------
-- Table structure for crud_one_to_one_pk
-- ----------------------------
DROP TABLE IF EXISTS "public"."crud_one_to_one_pk";
CREATE TABLE "public"."crud_one_to_one_pk" (
  "crud_one_to_one_pk_id" uuid NOT NULL,
  "crud_one_to_one_pk_nama" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "crud_one_to_one_pk_dibuat_pada" timestamp(0),
  "crud_one_to_one_pk_diubah_pada" timestamp(0)
)
;

-- ----------------------------
-- Records of crud_one_to_one_pk
-- ----------------------------

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS "public"."failed_jobs";
CREATE TABLE "public"."failed_jobs" (
  "id" int8 NOT NULL DEFAULT nextval('failed_jobs_id_seq'::regclass),
  "uuid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "connection" text COLLATE "pg_catalog"."default" NOT NULL,
  "queue" text COLLATE "pg_catalog"."default" NOT NULL,
  "payload" text COLLATE "pg_catalog"."default" NOT NULL,
  "exception" text COLLATE "pg_catalog"."default" NOT NULL,
  "failed_at" timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for grup
-- ----------------------------
DROP TABLE IF EXISTS "public"."grup";
CREATE TABLE "public"."grup" (
  "grup_id" uuid NOT NULL,
  "grup_nama" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "grup_deskripsi" text COLLATE "pg_catalog"."default" NOT NULL,
  "grup_dibuat_pada" timestamp(0),
  "grup_diubah_pada" timestamp(0)
)
;

-- ----------------------------
-- Records of grup
-- ----------------------------
INSERT INTO "public"."grup" VALUES ('a6d315d6-c86d-44c6-bc60-2f6f83c8ce2f', 'Root', 'Root', '2023-02-20 05:35:35', '2023-02-20 05:35:35');
INSERT INTO "public"."grup" VALUES ('4e23cb6e-037a-42b7-abb2-335944a11304', 'Admin', 'Admin', '2023-02-20 05:35:35', '2023-02-20 05:35:35');
INSERT INTO "public"."grup" VALUES ('23c9612b-3f8f-4c80-9402-5c9a224a0f25', 'Pengguna', 'Pengguna', '2023-02-20 05:35:35', '2023-02-20 05:35:35');
INSERT INTO "public"."grup" VALUES ('19134d98-adee-4d42-ad5b-bff75ce05ecd', 'test', 'test', '2023-09-13 02:43:27', '2023-09-13 02:43:27');

-- ----------------------------
-- Table structure for grup_aksi
-- ----------------------------
DROP TABLE IF EXISTS "public"."grup_aksi";
CREATE TABLE "public"."grup_aksi" (
  "grup_aksi_id" uuid NOT NULL,
  "grup_aksi_aksi_id" uuid NOT NULL,
  "grup_aksi_grup_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of grup_aksi
-- ----------------------------
INSERT INTO "public"."grup_aksi" VALUES ('96d93b43-7066-4d78-afad-907b8b11e732', 'c9b32af3-40cd-4edf-82ea-4fd971fc7d1e', 'a6d315d6-c86d-44c6-bc60-2f6f83c8ce2f');
INSERT INTO "public"."grup_aksi" VALUES ('d98c8d72-c189-49fc-ba6e-14a5abe9f421', 'c2d1059b-2e40-4311-a3b1-245f001aec08', 'a6d315d6-c86d-44c6-bc60-2f6f83c8ce2f');
INSERT INTO "public"."grup_aksi" VALUES ('a638c587-6be5-44c6-9ec9-04329952eb36', '590f99a7-5b24-4900-a0cc-e6e771dfef6b', 'a6d315d6-c86d-44c6-bc60-2f6f83c8ce2f');

-- ----------------------------
-- Table structure for grup_aplikasi
-- ----------------------------
DROP TABLE IF EXISTS "public"."grup_aplikasi";
CREATE TABLE "public"."grup_aplikasi" (
  "grup_aplikasi_id" uuid NOT NULL,
  "grup_aplikasi_grup_id" uuid NOT NULL,
  "grup_aplikasi_aplikasi_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of grup_aplikasi
-- ----------------------------

-- ----------------------------
-- Table structure for grup_menu_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."grup_menu_item";
CREATE TABLE "public"."grup_menu_item" (
  "grup_menu_item_id" uuid NOT NULL,
  "grup_menu_item_grup_id" uuid NOT NULL,
  "grup_menu_item_menu_item_id" uuid NOT NULL,
  "grup_menu_item_tambah" varchar(5) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'tidak'::character varying,
  "grup_menu_item_ubah" varchar(5) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'tidak'::character varying,
  "grup_menu_item_hapus" varchar(5) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'tidak'::character varying
)
;
COMMENT ON COLUMN "public"."grup_menu_item"."grup_menu_item_tambah" IS 'ya | tidak';
COMMENT ON COLUMN "public"."grup_menu_item"."grup_menu_item_ubah" IS 'ya | tidak';
COMMENT ON COLUMN "public"."grup_menu_item"."grup_menu_item_hapus" IS 'ya | tidak';

-- ----------------------------
-- Records of grup_menu_item
-- ----------------------------
INSERT INTO "public"."grup_menu_item" VALUES ('6c2b5c10-dd75-4f1f-a593-fe51fd22a860', 'a6d315d6-c86d-44c6-bc60-2f6f83c8ce2f', 'e66593ce-a1e6-460c-a02b-00ffb4cfe78e', 'tidak', 'tidak', 'tidak');
INSERT INTO "public"."grup_menu_item" VALUES ('c67fc54c-8cb8-47cb-b73b-1c4a31389f7a', 'a6d315d6-c86d-44c6-bc60-2f6f83c8ce2f', 'f9cb165f-46db-403e-8303-58b135076258', 'tidak', 'tidak', 'tidak');
INSERT INTO "public"."grup_menu_item" VALUES ('ba535f1f-3c7c-4e01-9598-853fa0a89df0', 'a6d315d6-c86d-44c6-bc60-2f6f83c8ce2f', 'd7a3075d-222c-4515-aee6-323e092f0390', 'ya', 'ya', 'ya');
INSERT INTO "public"."grup_menu_item" VALUES ('b5e98dff-d7e1-4771-88b3-a78559eba5f6', 'a6d315d6-c86d-44c6-bc60-2f6f83c8ce2f', 'ae11577c-41b3-4765-85ee-d0c8f5f081f8', 'ya', 'ya', 'ya');
INSERT INTO "public"."grup_menu_item" VALUES ('049a1d49-942a-41b6-85c3-93edb37693f4', 'a6d315d6-c86d-44c6-bc60-2f6f83c8ce2f', '768fc19e-1d81-4461-bb31-0508e831b8eb', 'ya', 'ya', 'ya');
INSERT INTO "public"."grup_menu_item" VALUES ('6a311fc5-c31a-4e2d-97f9-1aef1fa14ca3', 'a6d315d6-c86d-44c6-bc60-2f6f83c8ce2f', '3c3b17c2-9fc6-4613-a910-3c0160919fe4', 'tidak', 'tidak', 'tidak');
INSERT INTO "public"."grup_menu_item" VALUES ('9896c1ed-bd1d-4934-94f2-7692e562dc59', 'a6d315d6-c86d-44c6-bc60-2f6f83c8ce2f', 'f220b842-d0b5-4c0d-9625-fff775e69762', 'ya', 'ya', 'ya');
INSERT INTO "public"."grup_menu_item" VALUES ('accdf0a8-ea0e-43a5-b59b-5b2af7412bb2', 'a6d315d6-c86d-44c6-bc60-2f6f83c8ce2f', 'c9c74676-8338-4da9-8fdd-546c5558eacb', 'ya', 'ya', 'ya');
INSERT INTO "public"."grup_menu_item" VALUES ('79663dea-0897-4c1d-ab1c-36ace4c0a725', 'a6d315d6-c86d-44c6-bc60-2f6f83c8ce2f', '83b74e56-ba43-41ad-ad11-31ff053e9125', 'tidak', 'tidak', 'tidak');
INSERT INTO "public"."grup_menu_item" VALUES ('a70a55f5-5c24-41bb-8870-e2e78624b112', 'a6d315d6-c86d-44c6-bc60-2f6f83c8ce2f', '75b20781-449f-4c1b-ad50-f13d2248ba81', 'ya', 'ya', 'ya');
INSERT INTO "public"."grup_menu_item" VALUES ('e3a8d048-c57c-4dec-bca5-819592683dfb', 'a6d315d6-c86d-44c6-bc60-2f6f83c8ce2f', '528f1659-7b4b-4f34-a51e-8369306c659f', 'tidak', 'tidak', 'tidak');
INSERT INTO "public"."grup_menu_item" VALUES ('ea1fccd0-0916-4447-818d-9ea5095029df', 'a6d315d6-c86d-44c6-bc60-2f6f83c8ce2f', '5726673f-0332-4ba0-a877-b4c239066e8e', 'ya', 'ya', 'ya');
INSERT INTO "public"."grup_menu_item" VALUES ('8589bb00-1472-4677-8418-62a8306896b6', 'a6d315d6-c86d-44c6-bc60-2f6f83c8ce2f', 'eb8086f8-b84f-4e8e-a0ff-1e0fe2a4c1f8', 'ya', 'ya', 'ya');
INSERT INTO "public"."grup_menu_item" VALUES ('e98cbdaf-de45-495f-a78f-26392bb6519b', 'a6d315d6-c86d-44c6-bc60-2f6f83c8ce2f', 'ccdae595-6d99-4b9d-a4d1-8864826fcba5', 'ya', 'ya', 'ya');

-- ----------------------------
-- Table structure for grup_unit_kerja
-- ----------------------------
DROP TABLE IF EXISTS "public"."grup_unit_kerja";
CREATE TABLE "public"."grup_unit_kerja" (
  "grup_unit_kerja_id" uuid NOT NULL,
  "grup_unit_kerja_grup_id" uuid NOT NULL,
  "grup_unit_kerja_unit_kerja_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of grup_unit_kerja
-- ----------------------------
INSERT INTO "public"."grup_unit_kerja" VALUES ('77ad2979-f1c9-4b5a-b9f2-d32566e7ff30', '4e23cb6e-037a-42b7-abb2-335944a11304', '0718f032-2d26-4db7-a885-15d7195cd938');

-- ----------------------------
-- Table structure for informasi
-- ----------------------------
DROP TABLE IF EXISTS "public"."informasi";
CREATE TABLE "public"."informasi" (
  "informasi_id" uuid NOT NULL,
  "informasi_judul" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "informasi_deskripsi" text COLLATE "pg_catalog"."default" NOT NULL,
  "informasi_dibuat_pada" timestamp(0),
  "informasi_diubah_pada" timestamp(0),
  "informasi_dibuat_pengguna_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of informasi
-- ----------------------------

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS "public"."kategori";
CREATE TABLE "public"."kategori" (
  "kategori_id" uuid NOT NULL,
  "kategori_nama" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "kategori_dibuat_pada" timestamp(0),
  "kategori_diubah_pada" timestamp(0),
  "kategori_dibuat_pengguna_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of kategori
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."menu";
CREATE TABLE "public"."menu" (
  "menu_id" uuid NOT NULL,
  "menu_nama" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "menu_dibuat_pada" timestamp(0),
  "menu_diubah_pada" timestamp(0)
)
;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO "public"."menu" VALUES ('568d3027-7a7d-4564-80be-dddb4fe36941', 'Sidebar', '2023-02-16 08:06:23', '2023-02-16 08:06:23');

-- ----------------------------
-- Table structure for menu_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."menu_item";
CREATE TABLE "public"."menu_item" (
  "menu_item_id" uuid NOT NULL,
  "menu_item_label" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "menu_item_tautan" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "menu_item_induk" varchar(75) COLLATE "pg_catalog"."default" NOT NULL DEFAULT '0'::character varying,
  "menu_item_urutan" int4 NOT NULL DEFAULT 0,
  "menu_item_icon" varchar(255) COLLATE "pg_catalog"."default",
  "menu_item_menu_id" uuid NOT NULL,
  "menu_item_kedalaman" int4 NOT NULL DEFAULT 0,
  "menu_item_dibuat_pada" timestamp(0),
  "menu_item_diubah_pada" timestamp(0)
)
;

-- ----------------------------
-- Records of menu_item
-- ----------------------------
INSERT INTO "public"."menu_item" VALUES ('e66593ce-a1e6-460c-a02b-00ffb4cfe78e', 'Dashboard', '/backoffice/dashboard', '0', 0, 'fas fa-tachometer-alt', '568d3027-7a7d-4564-80be-dddb4fe36941', 0, '2023-02-16 08:06:32', '2023-02-16 08:07:46');
INSERT INTO "public"."menu_item" VALUES ('f9cb165f-46db-403e-8303-58b135076258', 'Referensi', '/backoffice/referensi', '0', 1, 'fas fa-database', '568d3027-7a7d-4564-80be-dddb4fe36941', 0, '2023-09-13 02:52:08', '2023-09-13 02:58:33');
INSERT INTO "public"."menu_item" VALUES ('d7a3075d-222c-4515-aee6-323e092f0390', 'Kategori', '/backoffice/kategori', 'f9cb165f-46db-403e-8303-58b135076258', 2, 'fas fa-bars', '568d3027-7a7d-4564-80be-dddb4fe36941', 1, '2023-09-13 02:56:54', '2023-09-13 02:58:33');
INSERT INTO "public"."menu_item" VALUES ('ae11577c-41b3-4765-85ee-d0c8f5f081f8', 'Aplikasi', '/backoffice/aplikasi', 'f9cb165f-46db-403e-8303-58b135076258', 3, 'fas fa-rocket', '568d3027-7a7d-4564-80be-dddb4fe36941', 1, '2023-09-13 02:57:12', '2023-09-13 02:58:33');
INSERT INTO "public"."menu_item" VALUES ('768fc19e-1d81-4461-bb31-0508e831b8eb', 'Informasi', '/backoffice/informasi', '0', 4, 'fas fa-info', '568d3027-7a7d-4564-80be-dddb4fe36941', 0, '2023-09-13 02:58:22', '2023-09-13 02:58:36');
INSERT INTO "public"."menu_item" VALUES ('3c3b17c2-9fc6-4613-a910-3c0160919fe4', 'Setting', '/backoffice/setting', '0', 5, 'fas fa-cog', '568d3027-7a7d-4564-80be-dddb4fe36941', 0, '2023-02-17 03:13:22', '2023-09-13 02:58:36');
INSERT INTO "public"."menu_item" VALUES ('f220b842-d0b5-4c0d-9625-fff775e69762', 'Grup', '/backoffice/grup', '3c3b17c2-9fc6-4613-a910-3c0160919fe4', 6, 'far fa-id-card', '568d3027-7a7d-4564-80be-dddb4fe36941', 1, '2023-02-16 08:07:46', '2023-09-13 02:58:36');
INSERT INTO "public"."menu_item" VALUES ('c9c74676-8338-4da9-8fdd-546c5558eacb', 'Unit Kerja', '/backoffice/unit-kerja', '3c3b17c2-9fc6-4613-a910-3c0160919fe4', 7, 'far fa-building', '568d3027-7a7d-4564-80be-dddb4fe36941', 1, '2023-02-17 08:08:16', '2023-09-13 02:58:36');
INSERT INTO "public"."menu_item" VALUES ('83b74e56-ba43-41ad-ad11-31ff053e9125', 'Menu', '/backoffice/menu', '0', 8, 'far fa-compass', '568d3027-7a7d-4564-80be-dddb4fe36941', 0, '2023-02-16 08:19:02', '2023-09-13 02:58:36');
INSERT INTO "public"."menu_item" VALUES ('75b20781-449f-4c1b-ad50-f13d2248ba81', 'Pengguna', '/backoffice/pengguna', '0', 9, 'fas fa-users', '568d3027-7a7d-4564-80be-dddb4fe36941', 0, '2023-02-17 03:15:18', '2023-09-13 02:58:36');
INSERT INTO "public"."menu_item" VALUES ('528f1659-7b4b-4f34-a51e-8369306c659f', 'Example', '/backoffice/example', '0', 10, 'fas fa-wrench', '568d3027-7a7d-4564-80be-dddb4fe36941', 0, '2023-03-01 09:09:49', '2023-09-13 02:58:36');
INSERT INTO "public"."menu_item" VALUES ('5726673f-0332-4ba0-a877-b4c239066e8e', 'CRUD', '/backoffice/crud', '528f1659-7b4b-4f34-a51e-8369306c659f', 11, 'fas fa-plane', '568d3027-7a7d-4564-80be-dddb4fe36941', 1, '2023-03-01 09:10:21', '2023-09-13 02:58:36');
INSERT INTO "public"."menu_item" VALUES ('eb8086f8-b84f-4e8e-a0ff-1e0fe2a4c1f8', 'CRUD ONE TO ONE', '/backoffice/crud-one-to-one', '528f1659-7b4b-4f34-a51e-8369306c659f', 12, 'fas fa-plane', '568d3027-7a7d-4564-80be-dddb4fe36941', 1, '2023-03-01 09:14:11', '2023-09-13 02:58:36');
INSERT INTO "public"."menu_item" VALUES ('ccdae595-6d99-4b9d-a4d1-8864826fcba5', 'CRUD ONE TO MANY', '/backoffice/crud-one-to-many', '528f1659-7b4b-4f34-a51e-8369306c659f', 13, 'fas fa-plane', '568d3027-7a7d-4564-80be-dddb4fe36941', 1, '2023-03-01 09:14:34', '2023-09-13 02:58:36');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."migrations";
CREATE TABLE "public"."migrations" (
  "id" int4 NOT NULL DEFAULT nextval('migrations_id_seq'::regclass),
  "migration" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "batch" int4 NOT NULL
)
;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO "public"."migrations" VALUES (149, '2014_10_12_000000_create_users_table', 1);
INSERT INTO "public"."migrations" VALUES (150, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO "public"."migrations" VALUES (151, '2017_08_11_073824_create_menus_wp_table', 1);
INSERT INTO "public"."migrations" VALUES (152, '2017_08_11_074006_create_menu_items_wp_table', 1);
INSERT INTO "public"."migrations" VALUES (153, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO "public"."migrations" VALUES (154, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO "public"."migrations" VALUES (155, '2023_02_13_084602_rename_users_to_pengguna_table', 1);
INSERT INTO "public"."migrations" VALUES (156, '2023_02_14_023718_rename_column_pengguna_table', 1);
INSERT INTO "public"."migrations" VALUES (157, '2023_02_15_034417_create_grup_table', 1);
INSERT INTO "public"."migrations" VALUES (158, '2023_02_15_071651_rename_admin_menus_to_menu', 1);
INSERT INTO "public"."migrations" VALUES (159, '2023_02_15_071839_rename_admin_menu_items_to_menu_item', 1);
INSERT INTO "public"."migrations" VALUES (160, '2023_02_15_072050_rename_column_menu_table', 1);
INSERT INTO "public"."migrations" VALUES (161, '2023_02_15_072420_rename_column_menu_item_table', 1);
INSERT INTO "public"."migrations" VALUES (162, '2023_02_16_073513_create_grup_menu_item_table', 1);
INSERT INTO "public"."migrations" VALUES (163, '2023_02_16_075450_create_aksi_table', 1);
INSERT INTO "public"."migrations" VALUES (164, '2023_02_16_075708_create_aksi_grup_table', 1);
INSERT INTO "public"."migrations" VALUES (165, '2023_02_16_080303_create_pengguna_grup_table', 1);
INSERT INTO "public"."migrations" VALUES (166, '2023_02_17_080911_create_unit_kerja_table', 1);
INSERT INTO "public"."migrations" VALUES (167, '2023_02_17_082843_create_grup_unit_kerja_table', 1);
INSERT INTO "public"."migrations" VALUES (168, '2023_02_18_080654_rename_change_foreign_key_column_aksi_table', 1);
INSERT INTO "public"."migrations" VALUES (169, '2023_02_20_020918_add_column_pengguna_table', 1);
INSERT INTO "public"."migrations" VALUES (170, '2023_02_21_034058_rename_aksi_grup_to_grup_aksi_table', 1);
INSERT INTO "public"."migrations" VALUES (171, '2023_02_21_034309_rename_column_grup_aksi_table', 1);
INSERT INTO "public"."migrations" VALUES (172, '2023_02_21_044226_drop_foreignkey_grup_aksi_table', 1);
INSERT INTO "public"."migrations" VALUES (173, '2023_02_21_044309_add_foreignkey_grup_aksi_table', 1);
INSERT INTO "public"."migrations" VALUES (174, '2023_03_01_082017_create_pengguna_unit_kerja_table', 1);
INSERT INTO "public"."migrations" VALUES (175, '2023_03_10_025854_crud', 1);
INSERT INTO "public"."migrations" VALUES (176, '2023_03_10_025855_crud_one_to_one_pk', 1);
INSERT INTO "public"."migrations" VALUES (177, '2023_03_10_025856_crud_one_to_one_fk', 1);
INSERT INTO "public"."migrations" VALUES (178, '2023_03_10_025857_crud_one_to_many_pk', 1);
INSERT INTO "public"."migrations" VALUES (179, '2023_03_10_025858_crud_one_to_many_fk', 1);
INSERT INTO "public"."migrations" VALUES (180, '2023_09_06_072944_create_informasi_table', 1);
INSERT INTO "public"."migrations" VALUES (181, '2023_09_06_074643_create_kategori_table', 1);
INSERT INTO "public"."migrations" VALUES (182, '2023_09_06_075554_create_aplikasi_table', 1);
INSERT INTO "public"."migrations" VALUES (183, '2023_09_07_022900_create_grup_aplikasi_table', 1);
INSERT INTO "public"."migrations" VALUES (184, '2023_09_07_023046_create_pengguna_aplikasi_table', 1);
INSERT INTO "public"."migrations" VALUES (185, '2023_09_07_024603_create_pengajuan_aplikasi_table', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS "public"."password_resets";
CREATE TABLE "public"."password_resets" (
  "email" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "token" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0)
)
;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for pengajuan_aplikasi
-- ----------------------------
DROP TABLE IF EXISTS "public"."pengajuan_aplikasi";
CREATE TABLE "public"."pengajuan_aplikasi" (
  "pengajuan_aplikasi_id" uuid NOT NULL,
  "pengajuan_aplikasi_pengguna_id" uuid NOT NULL,
  "pengajuan_aplikasi_aplikasi_id" uuid NOT NULL,
  "pengajuan_aplikasi_catatan" text COLLATE "pg_catalog"."default" NOT NULL,
  "pengajuan_aplikasi_status" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "pengajuan_aplikasi_dibuat_pada" timestamp(0),
  "pengajuan_aplikasi_diubah_pada" timestamp(0)
)
;

-- ----------------------------
-- Records of pengajuan_aplikasi
-- ----------------------------

-- ----------------------------
-- Table structure for pengguna
-- ----------------------------
DROP TABLE IF EXISTS "public"."pengguna";
CREATE TABLE "public"."pengguna" (
  "pengguna_id" uuid NOT NULL,
  "pengguna_nama" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "pengguna_email" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "pengguna_email_verifikasi_pada" timestamp(0),
  "pengguna_password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "pengguna_remember_token" varchar(100) COLLATE "pg_catalog"."default",
  "pengguna_dibuat_pada" timestamp(0),
  "pengguna_diubah_pada" timestamp(0),
  "pengguna_unit_kerja_id" varchar(255) COLLATE "pg_catalog"."default",
  "pengguna_nik" varchar(16) COLLATE "pg_catalog"."default",
  "pengguna_nip" varchar(25) COLLATE "pg_catalog"."default",
  "pengguna_telp" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "pengguna_jenis_kelamin" varchar(15) COLLATE "pg_catalog"."default" NOT NULL,
  "pengguna_agama" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "pengguna_alamat" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
INSERT INTO "public"."pengguna" VALUES ('2cad17c8-bf22-4ab8-b676-df3777e6ca5b', 'Handoko Adji Pangestu', 'handokoadjipangestu@gmail.com', '2023-02-20 09:30:23', '$2y$10$wKurAVh4ZMYQf4yNrCRSFO4NX8q6KZtxqnKhcypsoKEHMlHJ3CiJS', NULL, '2023-02-20 05:42:14', '2023-03-01 09:05:34', '86de0399-170d-4792-ba00-fcd16bca1270', '11217053', '11217054', '089650574913', 'laki-laki', 'islam', 'TEST');
INSERT INTO "public"."pengguna" VALUES ('1d711ed8-2873-4e45-b57c-2e9ce87bb50a', 'root', 'root@untirta.ac.id', '2023-02-20 09:30:23', '$2y$10$/39gUlb8OzVXV8Qhot3L9usShh8dz2bSAo1ayRhhLCX/OWwEr.xAK', NULL, '2023-02-16 08:06:00', '2023-03-01 07:26:01', NULL, '112170523', '11217051', '0896505749134', 'perempuan', 'islam', 'tbai');

-- ----------------------------
-- Table structure for pengguna_aplikasi
-- ----------------------------
DROP TABLE IF EXISTS "public"."pengguna_aplikasi";
CREATE TABLE "public"."pengguna_aplikasi" (
  "pengguna_aplikasi_id" uuid NOT NULL,
  "pengguna_aplikasi_pengguna_id" uuid NOT NULL,
  "pengguna_aplikasi_aplikasi_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of pengguna_aplikasi
-- ----------------------------

-- ----------------------------
-- Table structure for pengguna_grup
-- ----------------------------
DROP TABLE IF EXISTS "public"."pengguna_grup";
CREATE TABLE "public"."pengguna_grup" (
  "pengguna_grup_id" uuid NOT NULL,
  "pengguna_grup_pengguna_id" uuid NOT NULL,
  "pengguna_grup_grup_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of pengguna_grup
-- ----------------------------
INSERT INTO "public"."pengguna_grup" VALUES ('71a0bd46-3bbb-4b70-aade-744c0c390c83', '1d711ed8-2873-4e45-b57c-2e9ce87bb50a', 'a6d315d6-c86d-44c6-bc60-2f6f83c8ce2f');
INSERT INTO "public"."pengguna_grup" VALUES ('a83bdf33-82d9-40fb-8d47-7768583ca46b', '2cad17c8-bf22-4ab8-b676-df3777e6ca5b', '4e23cb6e-037a-42b7-abb2-335944a11304');

-- ----------------------------
-- Table structure for pengguna_unit_kerja
-- ----------------------------
DROP TABLE IF EXISTS "public"."pengguna_unit_kerja";
CREATE TABLE "public"."pengguna_unit_kerja" (
  "pengguna_unit_kerja_id" uuid NOT NULL,
  "pengguna_unit_kerja_pengguna_id" uuid NOT NULL,
  "pengguna_unit_kerja_unit_kerja_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of pengguna_unit_kerja
-- ----------------------------
INSERT INTO "public"."pengguna_unit_kerja" VALUES ('4e638af5-d48b-48a9-97af-ce35f9a1d5fc', '2cad17c8-bf22-4ab8-b676-df3777e6ca5b', '86de0399-170d-4792-ba00-fcd16bca1270');
INSERT INTO "public"."pengguna_unit_kerja" VALUES ('63b2418e-e714-47c2-a57f-8943dbea1f2a', '2cad17c8-bf22-4ab8-b676-df3777e6ca5b', '0718f032-2d26-4db7-a885-15d7195cd938');

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS "public"."personal_access_tokens";
CREATE TABLE "public"."personal_access_tokens" (
  "id" int8 NOT NULL DEFAULT nextval('personal_access_tokens_id_seq'::regclass),
  "tokenable_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "tokenable_id" int8 NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "token" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "abilities" text COLLATE "pg_catalog"."default",
  "last_used_at" timestamp(0),
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for unit_kerja
-- ----------------------------
DROP TABLE IF EXISTS "public"."unit_kerja";
CREATE TABLE "public"."unit_kerja" (
  "unit_kerja_id" uuid NOT NULL,
  "unit_kerja_nama" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "unit_kerja_deskripsi" text COLLATE "pg_catalog"."default" NOT NULL,
  "unit_kerja_dibuat_pada" timestamp(0),
  "unit_kerja_diubah_pada" timestamp(0)
)
;

-- ----------------------------
-- Records of unit_kerja
-- ----------------------------
INSERT INTO "public"."unit_kerja" VALUES ('86de0399-170d-4792-ba00-fcd16bca1270', 'Pusdainfo', 'Pusdainfo', '2023-02-20 05:39:02', '2023-02-20 05:39:02');
INSERT INTO "public"."unit_kerja" VALUES ('0718f032-2d26-4db7-a885-15d7195cd938', 'BAKP', 'BAKP', '2023-02-20 05:39:08', '2023-02-20 05:39:08');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."failed_jobs_id_seq"
OWNED BY "public"."failed_jobs"."id";
SELECT setval('"public"."failed_jobs_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."migrations_id_seq"
OWNED BY "public"."migrations"."id";
SELECT setval('"public"."migrations_id_seq"', 185, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."personal_access_tokens_id_seq"
OWNED BY "public"."personal_access_tokens"."id";
SELECT setval('"public"."personal_access_tokens_id_seq"', 1, false);

-- ----------------------------
-- Primary Key structure for table aksi
-- ----------------------------
ALTER TABLE "public"."aksi" ADD CONSTRAINT "aksi_pkey" PRIMARY KEY ("aksi_id");

-- ----------------------------
-- Primary Key structure for table aplikasi
-- ----------------------------
ALTER TABLE "public"."aplikasi" ADD CONSTRAINT "aplikasi_pkey" PRIMARY KEY ("aplikasi_id");

-- ----------------------------
-- Primary Key structure for table crud
-- ----------------------------
ALTER TABLE "public"."crud" ADD CONSTRAINT "crud_pkey" PRIMARY KEY ("crud_id");

-- ----------------------------
-- Primary Key structure for table crud_one_to_many_fk
-- ----------------------------
ALTER TABLE "public"."crud_one_to_many_fk" ADD CONSTRAINT "crud_one_to_many_fk_pkey" PRIMARY KEY ("crud_one_to_many_fk_id");

-- ----------------------------
-- Primary Key structure for table crud_one_to_many_pk
-- ----------------------------
ALTER TABLE "public"."crud_one_to_many_pk" ADD CONSTRAINT "crud_one_to_many_pk_pkey" PRIMARY KEY ("crud_one_to_many_pk_id");

-- ----------------------------
-- Primary Key structure for table crud_one_to_one_fk
-- ----------------------------
ALTER TABLE "public"."crud_one_to_one_fk" ADD CONSTRAINT "crud_one_to_one_fk_pkey" PRIMARY KEY ("crud_one_to_one_fk_id");

-- ----------------------------
-- Primary Key structure for table crud_one_to_one_pk
-- ----------------------------
ALTER TABLE "public"."crud_one_to_one_pk" ADD CONSTRAINT "crud_one_to_one_pk_pkey" PRIMARY KEY ("crud_one_to_one_pk_id");

-- ----------------------------
-- Uniques structure for table failed_jobs
-- ----------------------------
ALTER TABLE "public"."failed_jobs" ADD CONSTRAINT "failed_jobs_uuid_unique" UNIQUE ("uuid");

-- ----------------------------
-- Primary Key structure for table failed_jobs
-- ----------------------------
ALTER TABLE "public"."failed_jobs" ADD CONSTRAINT "failed_jobs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table grup
-- ----------------------------
ALTER TABLE "public"."grup" ADD CONSTRAINT "grup_pkey" PRIMARY KEY ("grup_id");

-- ----------------------------
-- Primary Key structure for table grup_aksi
-- ----------------------------
ALTER TABLE "public"."grup_aksi" ADD CONSTRAINT "aksi_grup_pkey" PRIMARY KEY ("grup_aksi_id");

-- ----------------------------
-- Primary Key structure for table grup_aplikasi
-- ----------------------------
ALTER TABLE "public"."grup_aplikasi" ADD CONSTRAINT "grup_aplikasi_pkey" PRIMARY KEY ("grup_aplikasi_id");

-- ----------------------------
-- Primary Key structure for table grup_menu_item
-- ----------------------------
ALTER TABLE "public"."grup_menu_item" ADD CONSTRAINT "grup_menu_item_pkey" PRIMARY KEY ("grup_menu_item_id");

-- ----------------------------
-- Primary Key structure for table grup_unit_kerja
-- ----------------------------
ALTER TABLE "public"."grup_unit_kerja" ADD CONSTRAINT "grup_unit_kerja_pkey" PRIMARY KEY ("grup_unit_kerja_id");

-- ----------------------------
-- Primary Key structure for table informasi
-- ----------------------------
ALTER TABLE "public"."informasi" ADD CONSTRAINT "informasi_pkey" PRIMARY KEY ("informasi_id");

-- ----------------------------
-- Primary Key structure for table kategori
-- ----------------------------
ALTER TABLE "public"."kategori" ADD CONSTRAINT "kategori_pkey" PRIMARY KEY ("kategori_id");

-- ----------------------------
-- Primary Key structure for table menu
-- ----------------------------
ALTER TABLE "public"."menu" ADD CONSTRAINT "admin_menus_pkey" PRIMARY KEY ("menu_id");

-- ----------------------------
-- Primary Key structure for table menu_item
-- ----------------------------
ALTER TABLE "public"."menu_item" ADD CONSTRAINT "admin_menu_items_pkey" PRIMARY KEY ("menu_item_id");

-- ----------------------------
-- Primary Key structure for table migrations
-- ----------------------------
ALTER TABLE "public"."migrations" ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table password_resets
-- ----------------------------
CREATE INDEX "password_resets_email_index" ON "public"."password_resets" USING btree (
  "email" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table pengajuan_aplikasi
-- ----------------------------
ALTER TABLE "public"."pengajuan_aplikasi" ADD CONSTRAINT "pengajuan_aplikasi_pkey" PRIMARY KEY ("pengajuan_aplikasi_id");

-- ----------------------------
-- Uniques structure for table pengguna
-- ----------------------------
ALTER TABLE "public"."pengguna" ADD CONSTRAINT "users_email_unique" UNIQUE ("pengguna_email");
ALTER TABLE "public"."pengguna" ADD CONSTRAINT "pengguna_pengguna_nik_unique" UNIQUE ("pengguna_nik");
ALTER TABLE "public"."pengguna" ADD CONSTRAINT "pengguna_pengguna_nip_unique" UNIQUE ("pengguna_nip");
ALTER TABLE "public"."pengguna" ADD CONSTRAINT "pengguna_pengguna_telp_unique" UNIQUE ("pengguna_telp");

-- ----------------------------
-- Primary Key structure for table pengguna
-- ----------------------------
ALTER TABLE "public"."pengguna" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("pengguna_id");

-- ----------------------------
-- Primary Key structure for table pengguna_aplikasi
-- ----------------------------
ALTER TABLE "public"."pengguna_aplikasi" ADD CONSTRAINT "pengguna_aplikasi_pkey" PRIMARY KEY ("pengguna_aplikasi_id");

-- ----------------------------
-- Primary Key structure for table pengguna_grup
-- ----------------------------
ALTER TABLE "public"."pengguna_grup" ADD CONSTRAINT "pengguna_grup_pkey" PRIMARY KEY ("pengguna_grup_id");

-- ----------------------------
-- Primary Key structure for table pengguna_unit_kerja
-- ----------------------------
ALTER TABLE "public"."pengguna_unit_kerja" ADD CONSTRAINT "pengguna_unit_kerja_pkey" PRIMARY KEY ("pengguna_unit_kerja_id");

-- ----------------------------
-- Indexes structure for table personal_access_tokens
-- ----------------------------
CREATE INDEX "personal_access_tokens_tokenable_type_tokenable_id_index" ON "public"."personal_access_tokens" USING btree (
  "tokenable_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "tokenable_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table personal_access_tokens
-- ----------------------------
ALTER TABLE "public"."personal_access_tokens" ADD CONSTRAINT "personal_access_tokens_token_unique" UNIQUE ("token");

-- ----------------------------
-- Primary Key structure for table personal_access_tokens
-- ----------------------------
ALTER TABLE "public"."personal_access_tokens" ADD CONSTRAINT "personal_access_tokens_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table unit_kerja
-- ----------------------------
ALTER TABLE "public"."unit_kerja" ADD CONSTRAINT "unit_kerja_pkey" PRIMARY KEY ("unit_kerja_id");

-- ----------------------------
-- Foreign Keys structure for table aksi
-- ----------------------------
ALTER TABLE "public"."aksi" ADD CONSTRAINT "aksi_aksi_menu_item_id_foreign" FOREIGN KEY ("aksi_menu_item_id") REFERENCES "public"."menu_item" ("menu_item_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table aplikasi
-- ----------------------------
ALTER TABLE "public"."aplikasi" ADD CONSTRAINT "aplikasi_aplikasi_dibuat_pengguna_id_foreign" FOREIGN KEY ("aplikasi_dibuat_pengguna_id") REFERENCES "public"."pengguna" ("pengguna_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table crud_one_to_many_fk
-- ----------------------------
ALTER TABLE "public"."crud_one_to_many_fk" ADD CONSTRAINT "crud_one_to_many_fk_crud_one_to_many_fk_crud_one_to_many_pk_id_" FOREIGN KEY ("crud_one_to_many_fk_crud_one_to_many_pk_id") REFERENCES "public"."crud_one_to_many_pk" ("crud_one_to_many_pk_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table crud_one_to_one_fk
-- ----------------------------
ALTER TABLE "public"."crud_one_to_one_fk" ADD CONSTRAINT "crud_one_to_one_fk_crud_one_to_one_fk_crud_one_to_one_pk_id_for" FOREIGN KEY ("crud_one_to_one_fk_crud_one_to_one_pk_id") REFERENCES "public"."crud_one_to_one_pk" ("crud_one_to_one_pk_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table grup_aksi
-- ----------------------------
ALTER TABLE "public"."grup_aksi" ADD CONSTRAINT "grup_aksi_grup_aksi_aksi_id_foreign" FOREIGN KEY ("grup_aksi_aksi_id") REFERENCES "public"."aksi" ("aksi_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."grup_aksi" ADD CONSTRAINT "grup_aksi_grup_aksi_grup_id_foreign" FOREIGN KEY ("grup_aksi_grup_id") REFERENCES "public"."grup" ("grup_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table grup_aplikasi
-- ----------------------------
ALTER TABLE "public"."grup_aplikasi" ADD CONSTRAINT "grup_aplikasi_grup_aplikasi_aplikasi_id_foreign" FOREIGN KEY ("grup_aplikasi_aplikasi_id") REFERENCES "public"."aplikasi" ("aplikasi_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."grup_aplikasi" ADD CONSTRAINT "grup_aplikasi_grup_aplikasi_grup_id_foreign" FOREIGN KEY ("grup_aplikasi_grup_id") REFERENCES "public"."grup" ("grup_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table grup_menu_item
-- ----------------------------
ALTER TABLE "public"."grup_menu_item" ADD CONSTRAINT "grup_menu_item_grup_menu_item_grup_id_foreign" FOREIGN KEY ("grup_menu_item_grup_id") REFERENCES "public"."grup" ("grup_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."grup_menu_item" ADD CONSTRAINT "grup_menu_item_grup_menu_item_menu_item_id_foreign" FOREIGN KEY ("grup_menu_item_menu_item_id") REFERENCES "public"."menu_item" ("menu_item_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table grup_unit_kerja
-- ----------------------------
ALTER TABLE "public"."grup_unit_kerja" ADD CONSTRAINT "grup_unit_kerja_grup_unit_kerja_grup_id_foreign" FOREIGN KEY ("grup_unit_kerja_grup_id") REFERENCES "public"."grup" ("grup_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."grup_unit_kerja" ADD CONSTRAINT "grup_unit_kerja_grup_unit_kerja_unit_kerja_id_foreign" FOREIGN KEY ("grup_unit_kerja_unit_kerja_id") REFERENCES "public"."unit_kerja" ("unit_kerja_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table informasi
-- ----------------------------
ALTER TABLE "public"."informasi" ADD CONSTRAINT "informasi_informasi_dibuat_pengguna_id_foreign" FOREIGN KEY ("informasi_dibuat_pengguna_id") REFERENCES "public"."pengguna" ("pengguna_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table kategori
-- ----------------------------
ALTER TABLE "public"."kategori" ADD CONSTRAINT "kategori_kategori_dibuat_pengguna_id_foreign" FOREIGN KEY ("kategori_dibuat_pengguna_id") REFERENCES "public"."pengguna" ("pengguna_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table menu_item
-- ----------------------------
ALTER TABLE "public"."menu_item" ADD CONSTRAINT "admin_menu_items_menu_foreign" FOREIGN KEY ("menu_item_menu_id") REFERENCES "public"."menu" ("menu_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table pengajuan_aplikasi
-- ----------------------------
ALTER TABLE "public"."pengajuan_aplikasi" ADD CONSTRAINT "pengajuan_aplikasi_pengajuan_aplikasi_aplikasi_id_foreign" FOREIGN KEY ("pengajuan_aplikasi_aplikasi_id") REFERENCES "public"."aplikasi" ("aplikasi_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."pengajuan_aplikasi" ADD CONSTRAINT "pengajuan_aplikasi_pengajuan_aplikasi_pengguna_id_foreign" FOREIGN KEY ("pengajuan_aplikasi_pengguna_id") REFERENCES "public"."pengguna" ("pengguna_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table pengguna_aplikasi
-- ----------------------------
ALTER TABLE "public"."pengguna_aplikasi" ADD CONSTRAINT "pengguna_aplikasi_pengguna_aplikasi_aplikasi_id_foreign" FOREIGN KEY ("pengguna_aplikasi_aplikasi_id") REFERENCES "public"."aplikasi" ("aplikasi_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."pengguna_aplikasi" ADD CONSTRAINT "pengguna_aplikasi_pengguna_aplikasi_pengguna_id_foreign" FOREIGN KEY ("pengguna_aplikasi_pengguna_id") REFERENCES "public"."pengguna" ("pengguna_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table pengguna_grup
-- ----------------------------
ALTER TABLE "public"."pengguna_grup" ADD CONSTRAINT "pengguna_grup_pengguna_grup_grup_id_foreign" FOREIGN KEY ("pengguna_grup_grup_id") REFERENCES "public"."grup" ("grup_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."pengguna_grup" ADD CONSTRAINT "pengguna_grup_pengguna_grup_pengguna_id_foreign" FOREIGN KEY ("pengguna_grup_pengguna_id") REFERENCES "public"."pengguna" ("pengguna_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table pengguna_unit_kerja
-- ----------------------------
ALTER TABLE "public"."pengguna_unit_kerja" ADD CONSTRAINT "pengguna_unit_kerja_pengguna_unit_kerja_pengguna_id_foreign" FOREIGN KEY ("pengguna_unit_kerja_pengguna_id") REFERENCES "public"."pengguna" ("pengguna_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."pengguna_unit_kerja" ADD CONSTRAINT "pengguna_unit_kerja_pengguna_unit_kerja_unit_kerja_id_foreign" FOREIGN KEY ("pengguna_unit_kerja_unit_kerja_id") REFERENCES "public"."unit_kerja" ("unit_kerja_id") ON DELETE CASCADE ON UPDATE CASCADE;
