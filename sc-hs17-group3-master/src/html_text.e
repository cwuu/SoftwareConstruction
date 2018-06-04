note
	description: "Summary description for {HTML_TEXT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HTML_TEXT

inherit
	TEXT
	HTML_COMPONENT

create
	make

feature
	make (a_string: STRING)
		require
			not_empty: not a_string.is_empty
		do
			text := a_string
			is_bold := False
			is_italic := False
			is_underlined := False
			is_element := False
			tab_count := 1
		end

	bold
		do
			is_bold := True
		end

	italic
		do
			is_italic := True
		end

	underlined
		do
			is_underlined := True
		end

	accept (a_visitor: VISITOR)
		do
			a_visitor.visit_text (Current)
		end

end
