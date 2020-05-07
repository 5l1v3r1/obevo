//// METADATA DISABLE_QUOTED_IDENTIFIERS
create procedure ${refschema1_subschemaSuffixed}ProcWithDoubleQuotes as select "abc", * from ${refschema1_subschemaSuffixed}TestView
