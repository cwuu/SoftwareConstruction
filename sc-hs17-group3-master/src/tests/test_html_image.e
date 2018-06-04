note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
class
	TEST_HTML_IMAGE

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

	test_html_image_01
	-- New test routine
	note
		testing: "covers/{HTML_IMAGE}.make"
	local
		aImage: HTML_IMAGE
		source: STRING
		alt_text: STRING
	do
		source := "image/test_image.jpg"
		alt_text := "alternative text"
		create aImage.make(source,alt_text)
		assert ("image directory is 'image/test_imag.jpg'", equal(aImage.src,source))
		assert ("id is 'alternative text'", equal(aImage.alt,alt_text))
	end

	test_html_image_02
	-- Test the precondition actually failed
	note
		testing: "covers/{HTML_IMAGE}.make"
	local
		aImage: HTML_IMAGE
		has_exception: BOOLEAN
		empty_source: STRING --if passed by value, there's an error(VWMQ)
		alt_text: STRING
	do
		empty_source := ""
		alt_text := "alternative text"
		if not has_exception then
			--this should violate the precondition
			create aImage.make(empty_source,alt_text)

			--error if precondition not violated	
			assert("is_violated",False)
		end
	rescue
		assert("precond violated",exception_asserter.is_precondition_violated)
		has_exception := True
		retry
	end

	test_html_image_03
	-- Test the precondition actually failed
	note
		testing: "covers/{HTML_IMAGE}.make"
	local
		aImage: HTML_IMAGE
		has_exception: BOOLEAN
	do
		if not has_exception then
			--this should violate the precondition
			create aImage.make("image/test_image.jpg","")

			--error if precondition not violated	
			assert("is_violated",False)
		end
	rescue
		assert("precond violated",exception_asserter.is_precondition_violated)
		has_exception := True
		retry
	end

end

