//// CHANGE name=init
CREATE TABLE ${refschema1_subschemaSuffixed}TableSpecialCol
(
	idField INT NOT NULL,
	smallDateTimeField smalldatetime,
	textField TEXT,
	booleanCol ${refschema1_subschemaSuffixed}Boolean,
	boolean2Col ${refschema1_subschemaSuffixed}Boolean2,
	PRIMARY KEY (idField)
)
GO
