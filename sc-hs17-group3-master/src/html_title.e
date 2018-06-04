note
	description: "Summary description for {HTML_HEADING}."
	author: "emily wuu"
	date: "28.11.17"

class
	HTML_TITLE

inherit
	TITLE
	HTML_COMPONENT

create
	make

feature -- init
	-- Init size 1~6
	make(a_text: TEXT; a_size:INTEGER;)
	require
		size_constraint: a_size<7 and a_size >0
		--text_exists:not a_text.is_empty
		--size_exists:not a_size.is_empty
	do
		--changes need to be made here
		text := a_text
		size := a_size
		--set_text(a_text)
		--set_size(a_size)
		tab_count:=1
		is_element:=FALSE
	ensure

	end


--feature --setter
--	set_text(t:STRING)
--		require
--			text_exists: not t.is_empty
--		do
--			text:=t
--		ensure
--			text_set:text = t
--		end
--	set_size(s:INTEGER)
--		require
--			size_exists: not s.is_empty
--		do
--			size:=s
--		ensure
--			size_set:size = s
--		end
feature

		accept (a_visitor: VISITOR)
		do
			a_visitor.visit_title (Current) -- insert correct name
		end
end
