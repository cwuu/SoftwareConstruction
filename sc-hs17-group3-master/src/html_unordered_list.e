class
	HTML_UNORDERED_LIST
inherit
	HTML_COMPONENT

	LISTS
redefine
	row_list,
	add_row
	end


create
	make

feature

	row_list : LINKED_LIST[HTML_COMPONENT]

	make
		do
			create row_list.make

			--assure that list is empty

			tab_count := 1
			is_element := False
		end

	add_row(element : HTML_COMPONENT)
	do
		row_list.extend (element)
		element.set_tab (Current.tab_count + 1)
		element.make_element
	end

	prints
	do
		from
			row_list.start
		until
			row_list.off
		loop
			print (row_list.item.tab_count)
			row_list.forth
		end
	end

	accept (a_visitor: VISITOR)
		do
			a_visitor.visit_unordered_list (Current)
		end

end
