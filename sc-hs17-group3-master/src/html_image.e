note
		description: "Summary description for {HTML_IMAGE}."
		author: "emily wuu"
		date: "28.11.17"

class
		HTML_IMAGE

inherit
		IMAGE
		HTML_COMPONENT

create
        make

feature-- Initialize
	make(s:STRING; alt_name : STRING)
require
	src_exists:not s.is_empty
	alt_exists: not alt_name.empty
do
	src:=s
	alt := alt_name
	tab_count:=1
	is_element:= FALSE
end


feature -- setter

	accept (a_visitor: VISITOR)
		do
			a_visitor.visit_image (Current)
		end

end
