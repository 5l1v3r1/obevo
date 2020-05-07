//// METADATA DISABLE_QUOTED_IDENTIFIERS
-- ensure that ? is not interpreted as a parameter
create view ${refschema1_subschemaSuffixed}TestView AS select idField "MyId", stringField "MyString", myBooleanCol "MyMyBooleanCol" from ${refschema1_subschemaSuffixed}TestTable
