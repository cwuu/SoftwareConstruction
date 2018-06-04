note
	description: "Creates the anchor link for an internal link."
	author: "Anthony Kalbermatten"


class
	HTML_ANCHOR
inherit
	ANCHOR
		redefine
			add_link
			end


create
	make

feature

	make (id_input: INTEGER)
--		require
--			not_negative: id_input >= 0	
	 do
		id := id_input
		is_element := False
		tab_count := 1
	 end

	add_link(a_text : STRING) :HTML_INTERNAL_LINK
	local
		link : HTML_INTERNAL_LINK
		id_string : STRING
		do
			id_string := id.to_hex_string
			create link.make(id_string, a_text)
			Result := link
		end

	accept (a_visitor: HTML_CODE_GENERATOR_VISITOR)
		do
			a_visitor.visit_anchor (Current)
		end
end



