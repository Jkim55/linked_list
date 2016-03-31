# gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/linked_list"
require 'pry'

class NodeTest < Minitest::Test
  def setup
    @list = LinkedList.new
    @total_beats = []
  end

  def test_it_can_create_linked_list
    assert_equal LinkedList, @list.class
  end

  def test_default_head_is_nil
    assert_equal nil, @list.head
  end

  def test_it_can_append_one_new_node
    assert_equal "doop", @list.append("doop")
    assert_equal Node, @list.head.class
    assert_equal "doop", @list.head.beat
  end

  def test_it_can_append_multiple_nodes
  #   assert_equal "doop", @list.append("doop")
  #   assert_equal Node, @list.head.class
  #   assert_equal "doop", @list.head.beat
  end

  def test_head_next_node_is_nil
    @list.append("doop")
    assert_equal nil, @list.head.next_node
  end

  def test_when_node_is_not_head_it_can_still_have_a_next_node
  #   @list.append("doop")
  #   assert_equal nil, @list.head.next_node
  end

  def test_it_can_count_the_elements_it_contains
    @list.append("doop")
    assert_equal 1, @list.count
  end


  def test_it_can_append_to_list_when_head_node_exists
    @list.append("doop")
    @list.append("deep")
    assert_equal "doop", @list.head.beat
    assert_equal "deep", @list.head.next_node.beat
  end

  def test_it_wont_allow_invalid_nodes

  end

  def test_it_can_count_all_elements_when_more_than_one_exists
    @list.append("doop")
    @list.append("deep")
    @list.append("bo")
    @list.append("bi")
    @list.append("peep")
    @list.append("booop")
    assert_equal 6, @list.count
  end

  def test_it_can_create_a_string_with_elements_it_contains
    @list.append("doop")
    assert_equal "doop", @list.to_string
  end

  def test_it_can_create_string_with_all_elements
    @list.append("doop")
    @list.append("deep")
    @list.append("bo")
    @list.append("bi")
    @list.append("peep")
    @list.append("booop")
    assert_equal "doop deep bo bi peep booop", @list.to_string
  end

  def test_it_can_prepend
    @list.append("doop")
    @list.append("deep")
    @list.append("bo")
    @list.prepend("dop")
    assert_equal "dop", @list.head.beat
    assert_equal "doop", @list.head.next_node.beat
    assert_equal "deep", @list.head.next_node.next_node.beat
    assert_equal "bo", @list.head.next_node.next_node.next_node.beat
    assert_equal "dop doop deep bo", @list.to_string
    assert_equal 4, @list.count
  end

  def test_it_can_insert_a_node_into_a_specific_position
    @list.append("doop")
    @list.append("deep")
    @list.append("bo")

    assert_equal "woo", @list.insert(1, "woo")
    assert_equal "woo", @list.head.next_node.beat
    assert_equal "doop woo deep bo", @list.to_string
    assert_equal 4, @list.count
    # assert_equal "woo" list.insert(1, "woo") (2,"woop") # insert multiple nodes here
  end

  def test_it_can_insert_multiple_nodes_into_a_specified_positions
    @list.append("doop")
    @list.append("deep")
    @list.append("bo")

    assert_equal "woo", @list.insert(1, "woo")
    assert_equal "whoop", @list.insert(2, "whoop")
    assert_equal "woo", @list.head.next_node.beat
    assert_equal "doop woo whoop deep bo", @list.to_string
    assert_equal 5, @list.count
    # assert_equal "woo" list.insert(1, "woo") (2,"woop") # insert multiple nodes here
  end

  def test_beat_of_all_nodes_are_stored_within_total_beats
    @list.append("doop")
    @list.append("deep")
    @list.append("bo")

    assert_equal "doop deep bo", @list.to_string
    assert_equal 3, @list.count
    assert_equal "bo", @list.head.next_node.next_node.beat
    assert_equal ["doop", "deep", "bo"], @list.total_beats
    # add more assertions to test scope of the test
  end

  def test_it_can_find_beats
    @list.append("doop")
    @list.append("deep")
    @list.append("bo")
    @list.append("bi")
    @list.append("peep")
    @list.append("booop")
    assert_equal "doop deep bo bi peep booop", @list.to_string

    assert_equal "doop", @list.find(0, 1)
    assert_equal "deep bo", @list.find(1, 2)
    # assert_equal "deep bo", @list.find(1, -2) # prolly seperate test
    # assert_equal "deep bo", @list.find(1, "word") # prolly seperate test

    # assert_equal "deep bo", @list.find(1, 2) # prolly it does note mutilate the list
  end

  def test_that_it_can_find_beats_that_are_within_list
    @list.append("doop")
    @list.append("deep")
    @list.append("bo")
    @list.append("bi")

    assert @list.includes?("deep")
    assert_equal false, @list.includes?("dep") # make edge case test & try other invalid
  end

  def test_that_it_can_delete_last_element
    @list.append("doop")
    @list.append("deep")
    @list.append("bo")
    @list.append("bi")

    assert_equal "bi", @list.pop
    assert_equal "doop deep bo", @list.to_string
    assert_equal "bi", @list.pop
    assert_equal "doop deep", @list.to_string
  end
end
