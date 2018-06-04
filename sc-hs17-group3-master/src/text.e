note
	description: "italic text"
	author: ""
	date: "$Date$"
	revision: "$Revision 0.1$"

deferred class
	TEXT

inherit
	COMPONENT

feature
	text: STRING
feature -- styles
	is_bold: BOOLEAN
	is_italic: BOOLEAN
	is_underlined: BOOLEAN
	
	bold
		deferred
		end

	italic
		deferred
		end

	underlined
		deferred
		end

end
