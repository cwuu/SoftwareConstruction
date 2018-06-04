deferred class
	DOCUMENT_FACTORY


feature
		anchor_manager : ANCHOR_MANAGER
			deferred
			end

--		document_link(url : STRING; clickable : STRING): LINK
--			deferred
--			end

		title(a_text: TEXT; a_size:INTEGER) :TITLE
			deferred
			end

		image(a_src : STRING; an_alt : STRING) : IMAGE
			deferred
			end

		link(url : STRING; clickable : STRING) : LINK
			deferred
			end

		ordered_list : LISTS
			deferred
			end

		paragraph :PARAGRAPH
			deferred
			end

		snippet(input :STRING) : SNIPPET
			deferred
			end

		table(a_column:INTEGER) : TABLES
			deferred
			end

		text(content : STRING) :TEXT
			deferred
			end

		unordered_list :LISTS
			deferred
			end





end


