note
        description: "PARAGRAPH class"
        author: "emily wuu"
        date: "27.11.2017"

deferred class
        PARAGRAPH

inherit
        COMPONENT
feature -- status


        word_arr: LINKED_LIST [COMPONENT]

        new_element(new_word:COMPONENT)
        deferred
        end

end
