note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_HTML_TABLE

inherit
	EQA_TEST_SET
		redefine
			on_prepare
		end

feature {NONE}
	on_prepare
			-- <Precursor>
		do
			-- Initialize our exception asserter
			create exception_asserter
		end

feature -- Test routines

	exception_asserter: EXCEPTION_ASSERTER

	test_html_table_01
			-- New test routine
		note
			testing:  "html_table creation"
		local
			aTable: HTML_TABLE
		do
			create aTable.make(1)
			assert ("has one col", equal(aTable.column, 1))
			assert ("table is empty", aTable.row_list.is_empty)
		end

		test_html_table_02
		-- Test that precondition actually failed if column value <= 0
			local
				aTable: HTML_TABLE
				has_exception: BOOLEAN

			do
				if not has_exception then
					--this should violate the precondition
					create aTable.make(-1)

					--error if precondition not violated	
					assert("is_violated",False)
				end
			rescue
				assert("precond violated",exception_asserter.is_precondition_violated)
				has_exception := True
				retry
			end

	test_html_table_03
		note
			testing: "html_table with one row"
		local
			aText: HTML_TEXT
			aTable: HTML_TABLE
			aLinkedList: LINKED_LIST[COMPONENT]
		do
			create aTable.make(1)
			create aLinkedList.make
			create aText.make("I am a string")
			aLinkedList.extend(aText)
			aTable.add_row(aLinkedList) -- add row with proper length 1
			assert("row list not empty",not aTable.row_list.is_empty)
			assert("first row has column length",equal(aTable.row_list.first.count, aTable.column))
		end

	test_html_table_04
	-- Test that precondition actually failed if row entries > column value
		local
			aTable: HTML_TABLE
			aText: HTML_TEXT
			aLinkedList: LINKED_LIST[COMPONENT]
			has_exception: BOOLEAN

		do
			if not has_exception then
				create aTable.make(1)
				create aLinkedList.make
				create aText.make("I am a string")
				aLinkedList.extend(aText)
				aLinkedList.extend(aText)
				--add row with too many entries (precondition violation expected)
				aTable.add_row(aLinkedList)

				--error if precondition not violated	
				assert("is_violated",False)
			end
		rescue
			assert("is_precondition_violated:TRUE",exception_asserter.is_precondition_violated)
			has_exception := True
			retry
		end
end


