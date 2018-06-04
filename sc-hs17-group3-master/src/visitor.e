note
	description: "Summary description for {VISITOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	VISITOR



feature

	visit_anchor(an_anchor : ANCHOR)
	deferred
	end

	visit_ext_link(a_link: LINK)
	deferred
	end

	visit_title(a_title : TITLE)
	deferred
	end

	visit_image(an_image : IMAGE)
	deferred
	end

	visit_int_link(a_link : LINK)
	deferred
	end

	visit_ordered_list(ordered: LISTS)
	deferred
	end

	visit_paragraph(paragraph : PARAGRAPH)
	deferred
	end

	visit_snippet (snippet: SNIPPET)
	deferred
	end

	visit_table(a_table : TABLES)
	deferred
	end

	visit_text(a_text: TEXT)
	deferred
	end

	visit_unordered_list(unordered: LISTS)
	deferred
	end


end
