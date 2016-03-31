require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/linked_list"

class NodeTest < Minitest::Test

  def setup
    @list = LinkedList.new
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

  def test_the_next_node_of_head_is_nil
    @list.append("doop")
    assert_equal nil, @list.head.next_node
  end

  def test_it_can_append_more_nodes
    @list.append("doop")
    @list.append("deep")
    assert_equal "doop", @list.head.beat
    assert_equal "deep", @list.head.next_node.beat
  end

  def test_it_can_count_all_elements_within_the_list
    @list.append("doop")
    @list.append("deep")
    @list.append("bo")
    @list.append("bi")
    @list.append("peep")
    @list.append("booop")
    assert_equal 6, @list.count
  end

  def test_it_can_create_string_with_all_elements_within_the_list
    @list.append("doop")
    @list.append("deep")
    @list.append("bo")
    @list.append("bi")
    @list.append("peep")
    @list.append("booop")
    assert_equal "doop deep bo bi peep booop", @list.to_string
  end

  def test_it_can_insert_a_node_at_the_front_of_the_list
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
  end

  def test_that_it_can_find_beats_that_are_within_list
    @list.append("doop")
    @list.append("deep")
    @list.append("bo")
    @list.append("bi")
    @list.append("peep")
    @list.append("booop")
    assert_equal "doop deep bo bi peep booop", @list.to_string

    assert_equal "doop", @list.find(0, 1)
    assert_equal "deep bo", @list.find(1, 2)
  end

  def test_it_can_change_neg_inputs_to_absolute_values
    @list.append("doop")
    @list.append("deep")
    @list.append("bo")
    @list.append("bi")
    @list.append("peep")
    @list.append("booop")

    assert_equal "deep bo", @list.find(1, -2)
    assert_equal "bi peep", @list.find(-3, 2)
  end

  def test_it_can_only_accept_arguements_that_are_fixnums
    @list.append("doop")
    @list.append("deep")
    @list.append("bo")
    @list.append("bi")
    @list.append("peep")
    @list.append("booop")

    assert_equal nil, @list.find(1.5, 2)
    assert_equal nil, @list.find(1, "word")
  end

  def test_find_method_does_not_mutilate_the_link
    @list.append("doop")
    @list.append("deep")
    @list.append("bo")
    @list.append("bi")
    @list.append("peep")
    @list.append("booop")

    assert_equal "doop", @list.find(0, 1)
    assert_equal "deep bo", @list.find(1, 2)
    assert_equal "doop deep bo bi peep booop", @list.to_string
  end

  def test_that_it_can_check_if_beats_exists_within_the_list
    @list.append("doop")
    @list.append("deep")
    @list.append("bo")
    @list.append("bi")

    assert @list.includes?("deep")
    assert_equal false, @list.includes?("dep")
  end

  def test_it_can_only_can_only_check_for_strings
    @list.append("doop")
    @list.append("deep")
    @list.append("bo")
    @list.append("bi")
    @list.append("peep")
    @list.append("booop")

    assert_equal nil, @list.includes?(1)
    assert_equal nil, @list.includes?(2.35)
  end

  def test_that_it_can_delete_last_element
    @list.append("doop")
    @list.append("deep")
    @list.append("bo")
    @list.append("bi")

    assert_equal "bi", @list.pop
    assert_equal "bo", @list.pop
    assert_equal "doop deep", @list.to_string
  end
end
