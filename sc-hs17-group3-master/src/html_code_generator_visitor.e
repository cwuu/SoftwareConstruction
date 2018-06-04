note
	description: "Summary description for {HTML_CODE_GENERATOR_VISITOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HTML_CODE_GENERATOR_VISITOR

inherit
	VISITOR


create
	make

feature
	end_string : STRING



	make
		do
			create end_string.make_empty

		end

	visit_anchor(an_anchor : ANCHOR)
		local
			anchor : STRING
			an_id : INTEGER
			id : STRING
		do
			an_id := an_anchor.id
			id := an_id.to_hex_string
			anchor := indentation (an_anchor.tab_count) + "<a name=%"" + id + "%"></a>" + end_mark (an_anchor.is_element)
			end_string := end_string + anchor
		end



	visit_ext_link(a_link: HTML_EXTERNAL_LINK)
		local
			link : STRING
		do
			link := indentation (a_link.tab_count) + "<a href=%"" + a_link.source + "%">" + a_link.text + "</a>" + end_mark (a_link.is_element)
			end_string := end_string + link
		end

	visit_title (a_title: TITLE)

	        do
		       	inspect a_title.size
	           	when 1 then
	     	            end_string := end_string + indentation (a_title.tab_count)  + "<h1>"
	     	            a_title.text.accept(Current)
	     	          	end_string := end_string + "</h1>" + end_mark (a_title.is_element)
	       		when 2 then
	                   	end_string := end_string + indentation (a_title.tab_count)  + "<h2>"
	     	            a_title.text.accept(Current)
	     	          	end_string := end_string + "</h2>" + end_mark (a_title.is_element)
	           	when 3 then
	                   	end_string := end_string + indentation (a_title.tab_count)  + "<h3>"
	     	            a_title.text.accept(Current)
	     	          	end_string := end_string + "</h3>" + end_mark (a_title.is_element)
	           	when 4 then
	                   	end_string := end_string + indentation (a_title.tab_count)  + "<h4>"
	     	            a_title.text.accept(Current)
	     	          	end_string := end_string + "</h4>" + end_mark (a_title.is_element)
	           	when 5 then
	                   end_string := end_string + indentation (a_title.tab_count)  + "<h5>"
	     	            a_title.text.accept(Current)
	     	          	end_string := end_string + "</h5>" + end_mark (a_title.is_element)
	          	else
	                 	end_string := end_string + indentation (a_title.tab_count)  + "<h6>"
	     	            a_title.text.accept(Current)
	     	          	end_string := end_string + "</h6>" + end_mark (a_title.is_element)
	            end
	   		end

	 visit_image(an_image : IMAGE)
	 	local
			image : STRING
		do
			image := indentation (an_image.tab_count) + "<img src=%"" + an_image.src + "%" alt=%"" + an_image.alt + "%">" + end_mark (an_image.is_element)
			end_string := end_string + image
		end


	visit_int_link(a_link : LINK)
		local
			link : STRING
		do
			link := indentation (a_link.tab_count) + "<a href=%"#" + a_link.source + "%">" + a_link.text + "</a>" +  end_mark (a_link.is_element)
			end_string := end_string + link
		end

	visit_ordered_list(ordered: HTML_ORDERED_LIST)
		local
				u_rows :LINKED_LIST[HTML_COMPONENT]

			do
				end_string := end_string + indentation(ordered.tab_count) + "<ol>%N"
				u_rows := ordered.row_list
				from
					u_rows.start
				until
					u_rows.off
				loop
   					end_string := end_string + indentation (ordered.tab_count +1) + "<li>"
   					u_rows.item.set_tab (0)
   					u_rows.item.accept (Current)
   					end_string := end_string + "</li>%N"
					u_rows.forth
				end
				end_string := end_string + indentation (ordered.tab_count) +"</ol>" + end_mark (ordered.is_element)
			end

	visit_paragraph(paragraph : HTML_PARAGRAPH)
		local
			p_elements : LINKED_LIST[HTML_COMPONENT]
		do
			end_string := end_string + indentation (paragraph.tab_count) + "<p>"
			p_elements := paragraph.word_arr

			from
				p_elements.start
			until
				p_elements.off
			loop
				p_elements.item.accept (Current)
				p_elements.forth
			end
			end_string := end_string + "</p>" + end_mark (paragraph.is_element)
		end

	visit_snippet (snippet: SNIPPET)
		local
			a_snippet  : STRING
		do
			a_snippet := indentation (snippet.tab_count) + snippet.snippet + end_mark (snippet.is_element)
			end_string := end_string + a_snippet
		end

	visit_table(a_table : HTML_TABLE)
			local
			a_row : LINKED_LIST[COMPONENT]
       	do
       		create a_row.make
       		end_string:= end_string + indentation (a_table.tab_count) + "<table>%N"
       		from
       			a_table.row_list.start
       		until
       			a_table.row_list.off
       		loop
       			end_string:= end_string + indentation(a_table.tab_count +1) +  "<tr>%N"
       			a_row := a_table.row_list.item
       				from
       					a_row.start
       				until
						a_row.off
       				loop
						end_string:= end_string + indentation(a_table.tab_count +2) + "<th>"
						a_row.item.make_element
						a_row.item.set_tab (0)
						a_row.item.accept(Current)
						end_string := end_string + "</th>%N"
						a_row.forth
       				end
       				end_string := end_string + indentation(a_table.tab_count +1) + "</tr>%N"
       				a_table.row_list.forth
       				end
       				end_string := end_string + indentation(a_table.tab_count) +  "</table>" + end_mark(a_table.is_element)

		end

	visit_text(a_text: TEXT)
      	local
      		text: STRING
      		open_tag: STRING
      		close_tag: STRING
      	do
			text := a_text.text
			create open_tag.make_empty
			create close_tag.make_empty

			-- create opening tags
			if a_text.is_bold then
				open_tag := "<b>"
				close_tag := "</b>"
				end
			if a_text.is_italic then
				open_tag := open_tag + "<i>"
				close_tag := "</i>" + close_tag
				end
			if a_text.is_underlined then
				open_tag := open_tag + "<u>"
				close_tag := "</u>" + close_tag
				end
			end_string := end_string + open_tag + text + close_tag
		end


	visit_unordered_list(unordered: HTML_UNORDERED_LIST)
		local
				u_rows :LINKED_LIST[HTML_COMPONENT]

			do
				end_string := end_string + indentation(unordered.tab_count) + "<ul>%N"
				u_rows := unordered.row_list
				from
					u_rows.start
				until
					u_rows.off
				loop
   					end_string := end_string + indentation (unordered.tab_count +1) + "<li>"
   					u_rows.item.set_tab (0)
   					u_rows.item.accept (Current)
   					end_string := end_string + "</li>%N"
					u_rows.forth
				end
				end_string := end_string + indentation (unordered.tab_count) +"</ul>" + end_mark (unordered.is_element)
			end




	end_mark(element : BOOLEAN) : STRING
		local
			end_marker : STRING
		do
			end_marker := ""
		if
			element = False
		then
			end_marker := end_marker + "%N"
		end

		Result := end_marker

	end


	indentation(tab_amount : INTEGER) : STRING
		local
			tabs : STRING
			i : INTEGER

		do
			tabs := ""
			from
				i :=0
			until
				i = tab_amount
			loop
				tabs := tabs + "%T"
				i := i + 1
			end
			Result := tabs
	end




	get_string(list : LINKED_LIST[COMPONENT]): STRING
	do
			end_string := "<!DOCTYPE html>%N<html lang=%"en%">%N<head>%N%T<META CHARSET=%"UTF-8%">%N%T<title>A document created with a HTML Generator</title>%N</head>%N<body>%N%N"
			from
				list.start
			until
				list.off
			loop
				list.item.accept (Current)
				list.forth
			end
			end_string := end_string + "%N</body>%N</html>%N"
			Result := end_string
	end

end
