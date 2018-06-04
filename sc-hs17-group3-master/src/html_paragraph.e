note
	description: "Summary description for {HTML_PARAGRAPH}."
	author: "EMILY WUU"
	date: "28.11.17"

class
	HTML_PARAGRAPH

inherit
	HTML_COMPONENT
	PARAGRAPH
		redefine
			word_arr,
			new_element
			end

create
        make

feature-- Initialize
        -- insert text/link inside <p></p>
        make

        do
                create word_arr.make
                tab_count:= 1
                is_element:= FALSE
        ensure
                word_arr.is_empty
        end

feature
	  	word_arr: LINKED_LIST [HTML_COMPONENT]

feature
        new_element(new_word:HTML_COMPONENT)
        --add new text/link into word_arr
        do
        		new_word.make_element
        		new_word.set_tab (0)
                word_arr.extend(new_word)
        --ensure
          --      word_added: word_arr.has(new_word)
        end



		accept (a_visitor: VISITOR)
    	do
       		a_visitor.visit_paragraph (Current)
        end

end
