CREATE OR REPLACE EDITIONABLE TRIGGER ${refschema1_physicalName}.TRIGGER1
AFTER LOGON
ON ${refschema1_physicalName}.schema
--ON database
DECLARE
BEGIN
EXECUTE IMMEDIATE 'ALTER SESSION SET CURRENT_SCHEMA=${refschema1_physicalName}';
END
/
ALTER TRIGGER ${refschema1_physicalName}.TRIGGER1 ENABLE
