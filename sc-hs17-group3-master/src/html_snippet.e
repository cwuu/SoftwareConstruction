note
	description: "snippet insertion class"
	author: ""
	date: "$Date$"
	revision: "$Revision 0.1$"

class
	HTML_SNIPPET

inherit
	SNIPPET
	
	HTML_COMPONENT

create
	make

feature

	make(a_string: STRING) -- Snippet = one element in the html output list
	require
		not_empty: not a_string.is_empty
	do
		snippet := a_string
		tab_count := 1
		is_element := FALSE

	end
	
	accept (a_visitor: VISITOR)	
	do
			a_visitor.visit_snippet (Current) 
	end

end

