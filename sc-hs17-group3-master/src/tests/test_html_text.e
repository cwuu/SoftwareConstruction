note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_HTML_TEXT

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

	test_html_text_01

		note
			testing: "covers/{HTML_TEXT}"
			-- New test routine
		local
			aText: HTML_TEXT
		do
			create aText.make("I am a string")
			assert ("Content is 'I am a string'", equal(aText.text,"I am a string"))
			assert ("not bold", equal(aText.is_bold, False))
			assert ("not italic", equal(aText.is_italic, False))
			assert ("not underlined", equal(aText.is_underlined, False))
		end

	test_html_text_02
			-- New test routine
		note
			testing: "covers/{HTML_TEXT}"

		local
			aText: HTML_TEXT

		do
			create aText.make("I am a string")
			aText.bold
			aText.italic
			aText.underlined
			assert ("Content is 'I am a string'", equal(aText.text,"I am a string"))
			assert ("bold", equal(aText.is_bold, True))
			assert ("italic", equal(aText.is_italic, True))
			assert ("underlined", equal(aText.is_underlined, True))
		end

	test_html_text_03
		local
			aText: HTML_TEXT

			do
				create aText.make("I am a string")
				aText.bold
				assert ("Content is 'I am a string'", equal(aText.text,"I am a string"))
				assert ("bold", equal(aText.is_bold, True))
				assert ("not italic", equal(aText.is_italic, False))
				assert ("not underlined", equal(aText.is_underlined, False))
			end

	test_html_text_04
		local
			aText: HTML_TEXT

			do
				create aText.make("I am a string")
				aText.italic
				assert ("Content is 'I am a string'", equal(aText.text,"I am a string"))
				assert ("not bold", equal(aText.is_bold, False))
				assert ("italic", equal(aText.is_italic, True))
				assert ("not underlined", equal(aText.is_underlined, False))
			end

	test_html_text_05
		local
			aText: HTML_TEXT

			do
				create aText.make("I am a string")
				aText.underlined
				assert ("Content is 'I am a string'", equal(aText.text,"I am a string"))
				assert ("not bold", equal(aText.is_bold, False))
				assert ("not italic", equal(aText.is_italic, False))
				assert ("underlined", equal(aText.is_underlined, True))
			end

		test_html_text_06
			local
				aText: HTML_TEXT
				
				do
					create aText.make("I am a string")
					aText.bold
					aText.bold
					assert ("Content is 'I am a string'", equal(aText.text,"I am a string"))
					assert ("bold", equal(aText.is_bold, True))
					assert ("not italic", equal(aText.is_italic, False))
					assert ("not underlined", equal(aText.is_underlined, False))
				end

		test_html_text_07
		-- Test that precondition actually failed
			local
				aText: HTML_TEXT
				has_exception: BOOLEAN

				do
					if not has_exception then
						--this should violate the precondition
						create aText.make("")

						--error if precondition not violated	
						assert("is_violated",False)
					end
				rescue
					assert("precond violated",exception_asserter.is_precondition_violated)
					has_exception := True
					retry
				end
end


