# gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/linked_list"
require 'pry'

class NodeTest < Minitest::Test
  def setup
    @list_1 = LinkedList.new
  end

  def test_it_can_create_linked_list
    assert_equal LinkedList, @list_1.class
  end

  def test_default_head_is_nil
    assert_equal nil, @list_1.head
  end

  def test_it_can_append
    # binding.pry
    assert_equal "doop", @list_1.append("doop")
    assert_equal Node, @list_1.head.class
    assert_equal "doop", @list_1.head.beat
  end

  def test_it_can_have_a_next_node
    @list_1.append("doop")
    assert_equal nil, @list_1.head.next_node
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
    assert_equal "dop", @list_1.prepend("dop")
    assert_equal "dop doop deep bo", @list_1.to_string
  end

end


# prepend will add nodes to the beginning of the list.
# insert will insert one or more elements at a given position in the list.
# It takes 2 parameters, the 1st is the position at which to insert nodes,
# the 2nd parameter is the string of beat to be inserted

# > list = LinkedList.new
# > list.append("plop")
# => "plop"

# > list.to_string
# => "plop"

# > list.append("suu")
# => "suu"


# > list.to_string
# => "dop plop suu"

# > list.count
# => 3

# > list.insert(1, "woo")
# => "woo"

# list.to_string
# => "dop plop woo suu"
