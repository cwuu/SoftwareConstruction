note
	description: "Summary description for {HTML_ORDERED_LIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HTML_ORDERED_LIST
	inherit
		HTML_UNORDERED_LIST
			redefine
				accept
				end
create
	make


feature

	accept (a_visitor: VISITOR)
		do
			a_visitor.visit_ordered_list (Current)
		end
end
