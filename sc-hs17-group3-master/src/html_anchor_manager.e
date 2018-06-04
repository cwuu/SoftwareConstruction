note
	description: "Summary description for {HTML_ANCHOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HTML_ANCHOR_MANAGER
inherit
	ANCHOR_MANAGER


create
	make

feature
	
	make
		do
			id := 1
		end

	create_anchor : HTML_ANCHOR --creates an anchor object at this position, id is generated automatically
		local
			anchor : HTML_ANCHOR
		--require
		--	id_is_initialised: id>=1
		do
		 create anchor.make(id)
		 id := id + 1
		 Result := anchor
		end
		--ensure
		--	id_is_updated: id = old id + 1
end
