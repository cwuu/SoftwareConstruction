note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_HTML_PARAGRAPH

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

		test_html_paragraph_01
		-- New test routine
		note
			testing: "covers/{HTML_PARAGRAPH}.make"
		local
			aParagraph: HTML_PARAGRAPH
		do
			create aParagraph.make
			assert("paragraph has no word_arr",aParagraph.word_arr.is_empty)
		end


		test_html_paragraph_02
		-- New test routine
		note
			testing: "covers/{HTML_PARAGRAPH}.new_element()"
		local
			aParagraph: HTML_PARAGRAPH
			dummy_object1: HTML_IMAGE
		do
			create aParagraph.make
			create dummy_object1.make("images/image1", "alt_name")
			aParagraph.new_element(dummy_object1)
			assert("fail to add fist element as image to a paragraph", not aParagraph.word_arr.is_empty)
		end


		test_html_paragraph_03
		-- New test routine
		note
			testing: "covers/{HTML_PARAGRAPH}.new_element()"
		local
			aParagraph: HTML_PARAGRAPH
			aText: HTML_TEXT
			aText2: HTML_TEXT
		do
			create aParagraph.make
			create aText.make("I am a string")
			create aText2.make("I am a string2")
			aParagraph.new_element(aText)
			aParagraph.new_element(aText2)
			assert("fail to add second element to a paragraph", equal(aParagraph.word_arr.count,2))
		end

end
