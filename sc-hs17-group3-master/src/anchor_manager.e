note
	description: "Class to handle anchor creation and id distribution"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ANCHOR_MANAGER

feature
	id : INTEGER

	create_anchor : ANCHOR
	deferred
	end

end
