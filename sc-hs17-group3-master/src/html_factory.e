note
	description: "Summary description for {HTML_FACTORY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HTML_FACTORY

inherit
	DOCUMENT_FACTORY

create
	default_create


feature

		anchor_manager : ANCHOR_MANAGER
			local
					last_created_a_manager : HTML_ANCHOR_MANAGER
				do
					create last_created_a_manager.make
					Result := last_created_a_manager
			end


	--	document_link(path : STRING; clickable : STRING): LINK
	--		local
	--				last_created_link : HTML_DOCUMENT_LINK
	--			do
	--				create last_created_link.make(path, clickable)
	--				Result := last_created_link
	--		end

		title(a_text: TEXT; a_size:INTEGER) :TITLE
			local
					last_created_h : HTML_TITLE
				do
					create last_created_h.make(a_text, a_size)
					Result := last_created_h
			end

		image(a_src : STRING; an_alt : STRING) : IMAGE
			local
					last_created_i : HTML_IMAGE
				do
					create last_created_i.make(a_src, an_alt)
					Result := last_created_i
			end

		link(path : STRING; clickable : STRING) : LINK
			local
					last_created_link : HTML_EXTERNAL_LINK
				do
					create last_created_link.make(path, clickable)
					Result := last_created_link
			end

		ordered_list: LISTS
			local
					last_created_o_list : HTML_ORDERED_LIST
				do
					create last_created_o_list.make
					Result := last_created_o_list
			end

		paragraph : PARAGRAPH
			local
					last_created_paragraph : HTML_PARAGRAPH
				do
					create last_created_paragraph.make
					Result := last_created_paragraph
			end

		snippet(input :STRING) : SNIPPET
			local
					last_created_snippet : HTML_SNIPPET
				do
					create last_created_snippet.make(input)
					Result := last_created_snippet
			end

		table(a_column:INTEGER) : TABLES
		local
				last_created_table : HTML_TABLE
			do
				create last_created_table.make(a_column)
				Result := last_created_table
		end

		text(content : STRING) :TEXT
			local
					last_created_text : HTML_TEXT
				do
					create last_created_text.make(content)
					Result := last_created_text
			end


		unordered_list:LISTS
			local
				last_created_u_list : HTML_UNORDERED_LIST
				do
					create last_created_u_list.make
					Result := last_created_u_list
			end

end

