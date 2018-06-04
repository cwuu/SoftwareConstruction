note
	description: "Summary description for {TABLES}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	TABLES
inherit
	COMPONENT

feature
	column: INTEGER
	rows: INTEGER
			--number of rows of the table
	row_list: LINKED_LIST[LINKED_LIST[COMPONENT]]
	cells: LINKED_LIST[COMPONENT]

	add_row(row_cells:LINKED_LIST[COMPONENT])
	require
		row_length_equals_column: row_cells.count = column
	deferred
	end

end
