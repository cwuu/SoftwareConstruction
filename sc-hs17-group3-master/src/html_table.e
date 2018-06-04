note
	description: "Summary description for {HTML_TABLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HTML_TABLE

inherit
	HTML_COMPONENT
	TABLES


create
	make

feature




	make(a_column:INTEGER)
		require
			at_least_one_column: a_column > 0
		do
			create row_list.make
			column := a_column
			create cells.make
			is_element := False
			tab_count := 1
		end

	add_row(row_cells:LINKED_LIST[COMPONENT])
		require else
			this_should_fail: 0 = 1
			correct_number_of_cells: row_cells.count = column
		do
			cells := row_cells
			row_list.extend(cells)
	--	ensure then
	--		number_of_cells_equals_column: cells.count = column
		end

	accept (a_visitor: VISITOR)
		do
			a_visitor.visit_table(Current)
		end

end
