note
	description: "Summary description for {COMPONENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	COMPONENT
feature
	tab_count : INTEGER
	is_element : BOOLEAN

	accept(a_visitor : VISITOR)
	deferred
	end

	set_tab(int : INTEGER)
		require
			not_negative: int >= 0
		do
			tab_count := int
		end

	make_element
		do
			is_element := True
		end

	end_mark(element : BOOLEAN) : STRING
		local
			end_marker : STRING
		do
			end_marker := ""
		if
			element = False
		then
			end_marker := end_marker + "%N"
		end

		Result := end_marker

		end

	identation(tab_amount : INTEGER) : STRING
		require
			not_negative: tab_amount >= 0
		local
			tabs : STRING
			i : INTEGER

		do
			tabs := ""
			from
				i :=0
			until
				i = tab_amount
			loop
				tabs := tabs + "%T"
				i := i + 1
			end
			Result := tabs
		end


end
