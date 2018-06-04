note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_HTML_CODE_GENERATOR_VISITOR

inherit
	EQA_TEST_SET

feature -- Test routines

	test_visit_anchor
		-- Visitor Test 1
		note
			testing:  "covers/{HTML_CODE_GENERATOR_VISITOR}.visit_anchor"
		local
			cv : HTML_CODE_GENERATOR_VISITOR
			anchor : HTML_ANCHOR
			a_m : HTML_ANCHOR_MANAGER
		do
			create cv.make
			create a_m.make
			anchor := a_m.create_anchor
			--anchor.set_tab (0)
			--anchor.make_element

			cv.visit_anchor (anchor)


			assert("End_string is equal to text input", equal(cv.end_string, "%T<a name=%"00000001%"></a>%N"))
			--issue: change testplan by adding tabs
		end

	test_visit_internal_link
			-- Visitor Test 2
		note
			testing:  "covers/{HTML_CODE_GENERATOR_VISITOR}.visit_int_link"
		local
			cv : HTML_CODE_GENERATOR_VISITOR
			anchor : HTML_ANCHOR
			a_m : HTML_ANCHOR_MANAGER
			internal : HTML_INTERNAL_LINK
		do
			create cv.make
			create a_m.make
			anchor := a_m.create_anchor
			internal := anchor.add_link ("to top")

			cv.visit_int_link (internal)


			assert("End_string is equal to text input", equal(cv.end_string, "%T<a href=%"#00000001%">to top</a>%N"))
			--issue: change testplan by adding tabs
		end

	test_visit_external_link
			-- Visitor Test 3
		note
			testing:  "covers/{HTML_CODE_GENERATOR_VISITOR}.visit_int_link"
		local
			cv : HTML_CODE_GENERATOR_VISITOR
			link : HTML_EXTERNAL_LINK
		do
			create cv.make
			create link.make ("www.google.com", "Link to Google")

			cv.visit_ext_link (link)


			assert("End_string is equal to text input", equal(cv.end_string, "%T<a href=%"www.google.com%">Link to Google</a>%N"))
			--issue: change testplan by adding tabs
		end

		test_visit_title
			-- Visitor Test 4
		note
			testing:  "covers/{HTML_CODE_GENERATOR_VISITOR}.visit_title"
		local
			cv : HTML_CODE_GENERATOR_VISITOR
			text : HTML_TEXT
			title : HTML_TITLE
		do
			create cv.make
			create text.make ("%"I am a title%"")
			create title.make (text, 4)

			cv.visit_title (title)

			assert("End_string is equal to text input", equal(cv.end_string, "%T<h4>%"I am a title%"</h4>%N"))
		end

	test_visit_image
		-- Visitor Test 5
	note
		testing:  "covers/{HTML_CODE_GENERATOR_VISITOR}.visit_image"
	local
		cv : HTML_CODE_GENERATOR_VISITOR
		image : HTML_IMAGE
	do
		create cv.make
		create image.make ("testimage.jpg", "testimage")


		cv.visit_image (image)

		assert("End_string is equal to text input", equal(cv.end_string, "%T<img src=%"testimage.jpg%" alt=%"testimage%">%N"))
	end

test_visit_ordered_list
		-- Visitor Test 6
	note
		testing:  "covers/{HTML_CODE_GENERATOR_VISITOR}.visit_ordered_list"
	local
		cv : HTML_CODE_GENERATOR_VISITOR
		olist : HTML_ORDERED_LIST
		otext : HTML_TEXT
	do
		create cv.make
		create olist.make
		create otext.make ("I am dummy text")
		olist.add_row (otext)
		olist.add_row (otext)


		cv.visit_ordered_list (olist)

		assert("End_string is equal to text input", equal(cv.end_string, "%T<ol>%N%T%T<li>I am dummy text</li>%N%T%T<li>I am dummy text</li>%N%T</ol>%N"))
	end


	test_visit_unordered_list
		-- Visitor Test 7
	note
		testing:  "covers/{HTML_CODE_GENERATOR_VISITOR}.visit_unordered_list"
	local
		cv : HTML_CODE_GENERATOR_VISITOR
		ulist : HTML_UNORDERED_LIST
		utext : HTML_TEXT
	do
		create cv.make
		create ulist.make
		create utext.make ("I am dummy text")
		ulist.add_row (utext)
		ulist.add_row (utext)


		cv.visit_unordered_list (ulist)

		assert("End_string is equal to text input", equal(cv.end_string, "%T<ul>%N%T%T<li>I am dummy text</li>%N%T%T<li>I am dummy text</li>%N%T</ul>%N"))
	end

	test_visit_paragraph
		-- Visitor Test 8
	note
		testing:  "covers/{HTML_CODE_GENERATOR_VISITOR}.visit_paragraph"
	local
		cv : HTML_CODE_GENERATOR_VISITOR
		para : HTML_PARAGRAPH
		ptext : HTML_TEXT
	do
		create cv.make
		create para.make
		create ptext.make ("I am dummy text")
		para.new_element (ptext)


		cv.visit_paragraph (para)

		assert("End_string is equal to text input", equal(cv.end_string, "%T<p>I am dummy text</p>%N"))
	end


	test_visit_snippet
			-- Visitor Test 9
		note
			testing:  "covers/{HTML_CODE_GENERATOR_VISITOR}.visit_snippet"
		local
			cv : HTML_CODE_GENERATOR_VISITOR
			snippet : HTML_SNIPPET
		do
			create cv.make
			create snippet.make ("<p>I am a snippet</p>")


			cv.visit_snippet (snippet)

			assert("End_string is equal to text input", equal(cv.end_string, "%T<p>I am a snippet</p>%N"))
			--issue: change testplan by adding tabs
		end


	test_visit_table
		-- Visitor Test 10
	note
		testing:  "covers/{HTML_CODE_GENERATOR_VISITOR}.visit_table"
	local
		cv : HTML_CODE_GENERATOR_VISITOR
		table : HTML_TABLE
		ttext : HTML_TEXT
		tlist : LINKED_LIST[COMPONENT]
	do
		create cv.make
		create table.make (2)
		create ttext.make ("I am dummy text")
		create tlist.make

		ttext.set_tab (0)
		ttext.make_element

		tlist.extend (ttext)
		tlist.extend (ttext)


		table.add_row (tlist)
		table.add_row (tlist)

		cv.visit_table (table)

		assert("End_string is equal to text input", equal(cv.end_string, "%T<table>%N%T%T<tr>%N%T%T%T<th>I am dummy text</th>%N%T%T%T<th>I am dummy text</th>%N%T%T</tr>%N%T%T<tr>%N%T%T%T<th>I am dummy text</th>%N%T%T%T<th>I am dummy text</th>%N%T%T</tr>%N%T</table>%N"))

	end


	test_visit_text
			-- Visitor Test 11
		note
			testing:  "covers/{HTML_CODE_GENERATOR_VISITOR}.visit_text"
		local
			cv : HTML_CODE_GENERATOR_VISITOR
			text : HTML_TEXT
		do
			create cv.make
			create text.make ("I am dummy text")
			text.bold
			text.underlined
			text.italic
			cv.visit_text (text)

			assert("End_string is equal to text input", equal(cv.end_string, "<b><i><u>I am dummy text</u></i></b>"))
		end






end
