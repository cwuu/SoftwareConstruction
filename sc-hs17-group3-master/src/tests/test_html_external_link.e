note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_HTML_EXTERNAL_LINK

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


	test_html_external_link_make
	--External Link Test 1
	note
		testing:  "covers/{HTML_EXTERNAL_LINK}.make"
		local
			link : HTML_EXTERNAL_LINK
		do
			create link.make ("https://www.google.ch", "Text1")

			assert("Variable is equal to input when objexct is made", equal(link.source, "https://www.google.ch"))
			assert("Variable is equal to input when objexct is made", equal(link.text, "Text1"))

		end

	test_html_external_link_source_precondition
	--External Link Test 2
	note
		testing:  "covers/{HTML_EXTERNAL_LINK}.preconditions_source"
		local
			link : HTML_EXTERNAL_LINK
			has_exception: BOOLEAN
		do
			if not has_exception then
				create link.make ("", "TEXT")
				assert ("is violated", False)
			end

		rescue

			assert ( "precondition is violated", exception_asserter.is_precondition_violated)
			has_exception := True
      		retry

		end

	test_html_external_link_text_precondition
	--External Link Test 2
	note
		testing:  "covers/{HTML_EXTERNAL_LINK}.preconditions_source"
		local
			link : HTML_EXTERNAL_LINK
			has_exception: BOOLEAN
		do
			if not has_exception then
				create link.make ("TEXT", "")
				assert ("is violated", False)
			end

		rescue

			assert ( "precondition is violated", exception_asserter.is_precondition_violated)
			has_exception := True
      		retry

		end



end


