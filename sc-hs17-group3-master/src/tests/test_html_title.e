note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_HTML_TITLE

inherit
	EQA_TEST_SET
		redefine
			on_prepare
		end

feature {NONE} -- Events

	on_prepare
			-- <Precursor>
		do
			-- Initializie our exception asserter
			create exception_asserter

		end


feature -- Test routines

		exception_asserter: EXCEPTION_ASSERTER

		test_html_title_01
		note
			testing: "covers/{HTML_TITLE}.make"
		local
			aTitle: HTML_TITLE
			title_size: INTEGER
			title_name: HTML_TEXT
		do
			create title_name.make("title")
			title_size := 5
			create aTitle.make(title_name, title_size)
			assert ("Content is 'title'", equal(aTitle.text.text,title_name.text))
			assert ("size is 5", aTitle.size=title_size)
		end


		test_html_title_02
		-- Test that precondition actually failed
		note
			testing: "covers/{HTML_TITLE}.make"
		local
			aTitle: HTML_TITLE
			has_exception:  BOOLEAN
			title_size: INTEGER
			title_name: HTML_TEXT

		do
			if not has_exception then
				title_size := 7
				create title_name.make("title")

				--this should fail (title size out of range)
				create aTitle.make(title_name,title_size)
			assert("is_violated",False)
			end

		rescue
			assert("precond violated",exception_asserter.is_precondition_violated)
			has_exception := True
			retry
		end

end
