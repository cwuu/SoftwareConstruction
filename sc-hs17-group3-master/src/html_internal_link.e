note
	description: "Summary description for {HTML_INTERNAL_LINK}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HTML_INTERNAL_LINK

inherit
	HTML_COMPONENT
	LINK

create
	make

feature
	make(an_id: STRING; a_text: STRING)
		require
			id_is_not_empty : an_id.is_empty = FALSE
			text_is_not_empty : a_text.is_empty = FALSE
		do
			source := an_id
			text := a_text
			tab_count := 1
			is_element := FALSE
		end

	accept (a_visitor: VISITOR)
		do
			a_visitor.visit_int_link (Current)
		end

end

