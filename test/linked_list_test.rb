# gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/linked_list"
require 'pry'

class NodeTest < Minitest::Test
  def setup
    @list_1 = LinkedList.new
    @total_beats = []
  end

  def test_it_can_create_linked_list
    assert_equal LinkedList, @list_1.class
  end

  def test_default_head_is_nil
    assert_equal nil, @list_1.head
  end

  def test_it_can_append_one_new_node
    assert_equal "doop", @list_1.append("doop")
    assert_equal Node, @list_1.head.class
    assert_equal "doop", @list_1.head.beat
  end

  def test_it_can_append_multiple_nodes
  #   assert_equal "doop", @list_1.append("doop")
  #   assert_equal Node, @list_1.head.class
  #   assert_equal "doop", @list_1.head.beat
  end

  def test_head_next_node_is_nil
    @list_1.append("doop")
    assert_equal nil, @list_1.head.next_node
  end

  def test_when_node_is_not_head_it_can_still_have_a_next_node
  #   @list_1.append("doop")
  #   assert_equal nil, @list_1.head.next_node
  end

  def test_it_can_count_the_elements_it_contains
    @list_1.append("doop")
    assert_equal 1, @list_1.count
  end


  def test_it_can_append_to_list_when_head_node_exists
    @list_1.append("doop")
    @list_1.append("deep")
    assert_equal "doop", @list_1.head.beat
    assert_equal "deep", @list_1.head.next_node.beat
  end

  def test_it_can_count_all_elements_when_more_than_one_exists
    @list_1.append("doop")
    @list_1.append("deep")
    @list_1.append("bo")
    @list_1.append("bi")
    @list_1.append("peep")
    @list_1.append("booop")
    assert_equal 6, @list_1.count
  end

  def test_it_can_create_a_string_with_elements_it_contains
    @list_1.append("doop")
    assert_equal "doop", @list_1.to_string
  end

  def test_it_can_create_string_with_all_elements
    @list_1.append("doop")
    @list_1.append("deep")
    @list_1.append("bo")
    @list_1.append("bi")
    @list_1.append("peep")
    @list_1.append("booop")
    assert_equal "doop deep bo bi peep booop", @list_1.to_string
  end

  def test_it_can_prepend
    @list_1.append("doop")
    @list_1.append("deep")
    @list_1.append("bo")
    @list_1.prepend("dop")
    assert_equal "dop", @list_1.head.beat
    assert_equal "doop", @list_1.head.next_node.beat
    assert_equal "deep", @list_1.head.next_node.next_node.beat
    assert_equal "bo", @list_1.head.next_node.next_node.next_node.beat
    assert_equal "dop doop deep bo", @list_1.to_string
    assert_equal 4, @list_1.count
  end

  def test_it_can_insert_a_node_into_a_specific_position
    @list_1.append("doop")
    @list_1.append("deep")
    @list_1.append("bo")
    assert_equal "doop deep bo", @list_1.to_string
    assert_equal 3, @list_1.count


    assert_equal "woo", @list_1.insert(1, "woo")
    assert_equal "woo", @list_1.head.next_node.beat
    assert_equal "doop woo deep bo", @list_1.to_string
    assert_equal 4, @list_1.count
    # assert_equal "woo" list.insert(1, "woo") (2,"woop") # insert multiple nodes here
  end

  def test_beat_of_all_nodes_are_stored_within_total_beats
    @list_1.append("doop")
    @list_1.append("deep")
    @list_1.append("bo")

    assert_equal "doop deep bo", @list_1.total_beats.join(" ")
    assert_equal 3, @list_1.count
    assert_equal "woo", head.next_node.next_node.data
    # add more assertions to test scope of the test

  end
end

# Insert will insert 1 or more elements at a given position in the list.
# It takes 2 parameters, the 1st is the position at which to insert nodes,
# the 2nd parameter is the string of beat to be inserted

# ******************************    ITERATION 4    ******************************
# find takes two parameters, the first indicates the first position to return
# and the second parameter specifies how many elements to return.
# includes? gives back true or false whether the supplied value is in the list.
# pop removes elements the last element from the list.


# > list.to_string
# => "deep woo shi shu blop"

# > list.find(2, 1)
# => "shi"

# > list.find(1, 3)
# => "woo shi shu"

# > list.includes?("deep")
# => true

# > list.includes?("dep")
# => false

# > list.pop
# => "blop"

# > list.pop
# => "shu"

# > list.to_string
# => "deep woo shi"
