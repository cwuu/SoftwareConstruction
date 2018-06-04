class
	HTML_EXTERNAL_LINK

inherit
	HTML_COMPONENT

	LINK



create
	make

feature

	make (a_source : STRING; a_text : STRING)
		require
			source_not_empty: a_source.is_empty = FALSE
			text_not_empty: a_text.is_empty = FALSE
		do
			source := a_source
			text := a_text
			tab_count := 1
			is_element := FALSE
		end

	accept (a_visitor: VISITOR)
		do
			a_visitor.visit_ext_link (Current)
		end

end
