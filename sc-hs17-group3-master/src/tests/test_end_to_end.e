note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_END_TO_END

inherit
	EQA_TEST_SET
		redefine
			on_prepare
		end

feature {NONE} -- Events

	on_prepare
			-- <Precursor>
		do
			create html
			create list.make
			create string.make_empty
			create cgv.make
		end


	html : HTML_FACTORY
	list: LINKED_LIST[COMPONENT]
	string : STRING
	cgv : HTML_CODE_GENERATOR_VISITOR

feature -- Test routines

	test_end_to_end
		local


			text1: TEXT
			text2: TEXT
			text3: TEXT
			text4: TEXT
			main_title : TEXT
			sub_title : TEXT

			title1: TITLE
			title2: TITLE

			image1: IMAGE

			table1:TABLES


			row1: LINKED_LIST[COMPONENT]
			row2: LINKED_LIST[COMPONENT]

			link1:LINK
			link2:LINK
			link3:LINK

			anchor1:ANCHOR

			ordered_list1: LISTS
			unordered_list1: LISTS

			paragraph1:PARAGRAPH

			snippet1:SNIPPET

			manager: ANCHOR_MANAGER

			-- New test routine
		do

			manager := html.anchor_manager

			main_title := html.text ("Main title")
			title1:=html.title(main_title ,1)
			list.extend(title1)


			anchor1:= manager.create_anchor
			list.extend(anchor1)

			text1:=html.text("I am bold")
			text1.bold

			link1:=html.link("www.google.com", "Link to Google")

			paragraph1:= html.paragraph
			paragraph1.new_element(text1)
			paragraph1.new_element(link1)
			list.extend(paragraph1)

			text2:=html.text("I am cursive")
			text2.italic

			text3:=html.text("I am normal")

			image1:=html.image("testimage.jpg","This is a test image")

			unordered_list1:=html.unordered_list
			unordered_list1.add_row(text1)
			unordered_list1.add_row(text2)

			table1:=html.table(2)

			create row1.make
			create row2.make

			row1.extend (text2)
			text2.make_element
			text2.set_tab (0)
			row1.extend (image1)
			image1.make_element
			image1.set_tab (0)
			table1.add_row (row1)

			row2.extend (unordered_list1)
			unordered_list1.make_element
			unordered_list1.set_tab (0)
			row2.extend (text3)
			text3.make_element
			text3.set_tab (0)
			table1.add_row (row2)
			list.extend(table1)

			sub_title := html.text ("Subtitle")
			title2:=html.title(sub_title,3)
			list.extend(title2)

			link2:=html.link("C://...", "go to second page")

			snippet1 :=html.snippet("<b>I am a snippet</b>")

			text4:=html.text("I am bold and cursive and underlined")
			text4.bold
			text4.italic
			text4.underlined

			ordered_list1:=html.ordered_list
			ordered_list1.add_row(link2)
			ordered_list1.add_row(snippet1)
			ordered_list1.add_row(text4)
			list.extend(ordered_list1)

			link3 :=anchor1.add_link("Go to top")
			list.extend(link3)

			string := cgv.get_string (list)



			assert ("input string is right", equal(string, "<!DOCTYPE html>%N<html lang=%"en%">%N<head>%N%T<META CHARSET=%"UTF-8%">%N%T<title>A document created with a HTML Generator</title>%N</head>%N<body>%N%N%T<h1>Main title</h1>%N%T<a name=%"00000001%"></a>%N%T<p><b>I am bold</b><a href=%"www.google.com%">Link to Google</a></p>%N%T<table>%N%T%T<tr>%N%T%T%T<th><i>I am cursive</i></th>%N%T%T%T<th><img src=%"testimage.jpg%" alt=%"This is a test image%"></th>%N%T%T</tr>%N%T%T<tr>%N%T%T%T<th><ul>%N%T<li><b>I am bold</b></li>%N%T<li><i>I am cursive</i></li>%N</ul></th>%N%T%T%T<th>I am normal</th>%N%T%T</tr>%N%T</table>%N%T<h3>Subtitle</h3>%N%T<ol>%N%T%T<li><a href=%"C://...%">go to second page</a></li>%N%T%T<li><b>I am a snippet</b></li>%N%T%T<li><b><i><u>I am bold and cursive and underlined</u></i></b></li>%N%T</ol>%N%T<a href=%"#00000001%">Go to top</a>%N%N</body>%N</html>%N"))
		end

end


