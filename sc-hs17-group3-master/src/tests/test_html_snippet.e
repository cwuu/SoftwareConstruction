note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_HTML_SNIPPET

inherit
	EQA_TEST_SET
		redefine
			on_prepare
		end

feature {NONE}
	on_prepare
			-- <Precursor>
		do
			-- Initializie our exception asserter
			create exception_asserter
		end


feature -- Test routines

	exception_asserter: EXCEPTION_ASSERTER

	test_html_snippet_01
			-- New test routine
		local
			aSnippet: HTML_SNIPPET
		do
			create aSnippet.make("I am a string")
			assert ("not_implemented", equal(aSnippet.snippet,"I am a string"))
		end

	test_html_snippet_02
	-- Test that precondition actually failed
		local
			aSnippet: HTML_SNIPPET
			has_exception: BOOLEAN

			do
				if not has_exception then
					--this should violate the precondition
					create aSnippet.make("")

					--error if precondition not violated	
					assert("is_violated",False)
				end
			rescue
				assert("precond violated",exception_asserter.is_precondition_violated)
				has_exception := True
				retry
			end
end


