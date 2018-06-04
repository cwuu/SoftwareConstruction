note
	description: "Summary description for {ANCHORS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ANCHOR
inherit
	COMPONENT

feature

	id : INTEGER

	add_link(a_text: STRING) :LINK
	deferred
	end
end
