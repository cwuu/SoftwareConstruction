note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_HTML_UNORDERED_LIST

inherit
	EQA_TEST_SET
		redefine
			on_prepare
		end

feature {NONE} -- Events

	on_prepare
			-- <Precursor>
		do
			create list.make
		end

	list : HTML_UNORDERED_LIST

feature -- Test routines

	test_make
			-- Test that list is created
		note
			testing:  "covers/{HTML_UNORDERED_LIST.make}"
		do
			assert ("set tab count", list.tab_count = 1)
			assert ("not element", list.is_element = False)
			assert ("empty row list", list.row_list.is_empty = TRUE)
		end

	test_add_row
			-- Test that content will be added to row_list
		note
			testing:  "covers/{HTML_UNORDERED_LIST.add_row}"
		local
			text : HTML_TEXT
		do

			assert ("empty row list", list.row_list.is_empty = TRUE)
			create text.make ("TEXT")
			list.add_row (text)
			assert ("list has elements", list.row_list.is_empty = FALSE)

		end



end


