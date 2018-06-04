note
	description: "Summary description for {LISTS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	LISTS
inherit
	COMPONENT

feature

row_list : LINKED_LIST[COMPONENT]

add_row(element : COMPONENT)
deferred
end


end
