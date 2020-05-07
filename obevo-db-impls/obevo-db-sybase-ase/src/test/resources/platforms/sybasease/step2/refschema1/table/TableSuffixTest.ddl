//// CHANGE name=init
CREATE TABLE ${refschema1_subschemaSuffixed}TableSuffixTest
(
	idField INT NOT NULL,
	PRIMARY KEY (idField)
	WITH max_rows_per_page = 0, reservepagegap = 0
) LOCK DATAROWS
GO
