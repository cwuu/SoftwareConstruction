note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_HTML_ANCHOR

inherit
	EQA_TEST_SET
		redefine
			on_prepare
		end

feature {NONE}

	manager : HTML_ANCHOR_MANAGER
	cgv : HTML_CODE_GENERATOR_VISITOR
	exception_asserter: EXCEPTION_ASSERTER


feature {NONE} -- Events

	on_prepare
		do
			create manager.make
			create cgv.make
			create exception_asserter
end





feature -- Test routines

	test_manager_make
			--Anchor Test 1
		note
			testing:  "covers/{HTML_ANCHOR_MANAGER}.make"
		do
			assert ("id of initialized manager is 1", manager.id = 1)
		end


	test_manager_create_anchor
			--Anchor Test 2

		note
			testing:  "covers/{HTML_ANCHOR_MANAGER}.create_anchor"
		local
			anchor1 : HTML_ANCHOR
		do
			anchor1 := manager.create_anchor
			assert ("id of first created anchor is 1", anchor1.id = 1)
		end

	test_anchor_ids
			--Anchor Test 3

		note
			testing:  "covers/{HTML_ANCHOR_MANAGER}.create_anchor"
		local
			anchor1 : HTML_ANCHOR
			anchor2 : HTML_ANCHOR
		do
			anchor1 := manager.create_anchor
			anchor2 := manager.create_anchor

			assert ("ids of two anchors are different", anchor1.id /= anchor2.id)
		end

	test_internal_link_variables
			--Anchor Test 4

		note
			testing:  "covers/{HTML_ANCHOR_MANAGER}.create_anchor"
		local
			anchor1 : HTML_ANCHOR
			link1 : HTML_INTERNAL_LINK
		do
			anchor1 := manager.create_anchor
			link1 := anchor1.add_link ("click me to get to an other position")

			cgv.visit_int_link (link1)


			assert ("Id is the same as anchor", equal(anchor1.id.to_hex_string, link1.source))
			assert ("inserted string is link_string", equal("click me to get to an other position", link1.text))
		end


	test_internal_links_to_same_anchor
			--Anchor Test 5

		note
			testing:  "covers/{HTML_ANCHOR_MANAGER}.create_anchor"
		local
			anchor1 : HTML_ANCHOR
			link1 : HTML_INTERNAL_LINK
			link2 : HTML_INTERNAL_LINK
		do
			anchor1 := manager.create_anchor
			link1 := anchor1.add_link ("Internal_Link_Text")
			link2 := anchor1.add_link ("Internal_Link_Text")


			assert ("Id of the two links is the same", equal(link1.source, link2.source))

		end

	test_internal_links_precondition_source
			--Anchor Test 6

		note
			testing:  "covers/{HTML_INTERNAL_LINK}.preconditions_text"
		local
			link1 : HTML_INTERNAL_LINK
			has_exception: BOOLEAN
		do
			if not has_exception then
				create link1.make ("", "TEXT")
				assert ("is violated", False)
			end

		rescue

			assert ( "precondition is violated", exception_asserter.is_precondition_violated)
			has_exception := True
      		retry

		end

	test_internal_links_precondition_text
			--Anchor Test 7

		note
			testing:  "covers/{HTML_INTERNAL_LINK}.preconditions_text"
		local
			link1 : HTML_INTERNAL_LINK
			has_exception: BOOLEAN
		do
			if not has_exception then
				create link1.make ("TEXT", "")
				assert ("is violated", False)
			end

		rescue

			assert ( "precondition is violated", exception_asserter.is_precondition_violated)
			has_exception := True
      		retry

		end

end


