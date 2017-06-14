
   CREATE SEQUENCE  "MYSCHEMA01"."REGULAR_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 5 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION
~

  CREATE OR REPLACE EDITIONABLE PACKAGE "MYSCHEMA01"."PKG_SP_WITH_OVERLOAD" 
AS
    PROCEDURE SP_WITH_OVERLOAD;
    PROCEDURE SP_WITH_OVERLOAD(INVAL IN integer);
    PROCEDURE SP_WITH_OVERLOAD(var1 IN integer, INVALSTR IN VARCHAR);
END;


CREATE OR REPLACE EDITIONABLE PACKAGE BODY "MYSCHEMA01"."PKG_SP_WITH_OVERLOAD" 
AS
    PROCEDURE SP_WITH_OVERLOAD IS
    BEGIN
        DELETE FROM TABLE_A;
    END;

    PROCEDURE SP_WITH_OVERLOAD (INVAL IN integer) IS
    BEGIN
        DELETE FROM TABLE_A;
    END;

    PROCEDURE SP_WITH_OVERLOAD (var1 IN integer, INVALSTR IN VARCHAR) IS
    BEGIN
        DELETE FROM TABLE_A;
    END;
END;

~

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MYSCHEMA01"."SP1" IS
BEGIN
    -- ensure that SP comment remains
    DELETE FROM TABLE_A;
END;

~

  CREATE OR REPLACE EDITIONABLE PACKAGE "MYSCHEMA01"."PKG_FUNC_WITH_OVERLOAD" 
AS
    FUNCTION FUNC_WITH_OVERLOAD return integer;
    FUNCTION FUNC_WITH_OVERLOAD(var1 IN integer) return integer;
    FUNCTION FUNC_WITH_OVERLOAD(var1 IN integer, INVALSTR IN VARCHAR) return integer;
END;


CREATE OR REPLACE EDITIONABLE PACKAGE BODY "MYSCHEMA01"."PKG_FUNC_WITH_OVERLOAD" 
AS
    FUNCTION FUNC_WITH_OVERLOAD
    RETURN integer IS
    BEGIN
        RETURN 1;
    END;

    FUNCTION FUNC_WITH_OVERLOAD (var1 IN integer)
    RETURN integer IS
    BEGIN
        RETURN 1;
    END;

    FUNCTION FUNC_WITH_OVERLOAD (var1 IN integer, INVALSTR IN VARCHAR)
    RETURN integer IS
    BEGIN
        RETURN 1;
    END;
END;

~

  CREATE OR REPLACE EDITIONABLE FUNCTION "MYSCHEMA01"."FUNC1" 
RETURN integer IS
BEGIN
    -- ensure that func comment remains
    RETURN 1;
END;

~

  CREATE TABLE "MYSCHEMA01"."TABLE_B_WITH_FK" 
   (	"B_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"OTHER_A_ID" NUMBER(*,0), 
	 PRIMARY KEY ("B_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_A" FOREIGN KEY ("OTHER_A_ID")
	  REFERENCES "MYSCHEMA01"."TABLE_A" ("A_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
~

  CREATE UNIQUE INDEX "MYSCHEMA01"."SYS_C005395" ON "MYSCHEMA01"."TABLE_B_WITH_FK" ("B_ID")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  TABLESPACE "USERS"
~

  CREATE TABLE "MYSCHEMA01"."TABLE_B_WITH_MULTICOL_FK" 
   (	"B_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"OTHER_A1_ID" NUMBER(*,0), 
	"OTHER_A2_ID" NUMBER(*,0), 
	 PRIMARY KEY ("B_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_A_MULTICOL" FOREIGN KEY ("OTHER_A1_ID", "OTHER_A2_ID")
	  REFERENCES "MYSCHEMA01"."TABLE_A_MULTICOL_PK" ("A1_ID", "A2_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
~

  CREATE UNIQUE INDEX "MYSCHEMA01"."SYS_C005392" ON "MYSCHEMA01"."TABLE_B_WITH_MULTICOL_FK" ("B_ID")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  TABLESPACE "USERS"
~

  CREATE TABLE "MYSCHEMA01"."TABLE_A_MULTICOL_PK" 
   (	"A1_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"A2_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"VAL3" NUMBER(*,0), 
	 PRIMARY KEY ("A1_ID", "A2_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
~

  CREATE UNIQUE INDEX "MYSCHEMA01"."SYS_C005390" ON "MYSCHEMA01"."TABLE_A_MULTICOL_PK" ("A1_ID", "A2_ID")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  TABLESPACE "USERS"
~

  CREATE TABLE "MYSCHEMA01"."TABLE_A" 
   (	"A_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"A2_ID" NUMBER(*,0), 
	 PRIMARY KEY ("A_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
~

  CREATE UNIQUE INDEX "MYSCHEMA01"."SYS_C005387" ON "MYSCHEMA01"."TABLE_A" ("A_ID")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  TABLESPACE "USERS"
~

  CREATE TABLE "MYSCHEMA01"."METADATA_TEST_TABLE" 
   (	"AFIELD" NUMBER(*,0), 
	"BFIELD" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
~