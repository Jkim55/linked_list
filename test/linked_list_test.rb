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
    assert_equal "doop", @list_1.append("doop")
    assert_equal Node, @list_1.head.class
    assert_equal "doop", @list_1.head.data
  end

  def test_it_can_have_a_next_node
    @list_1.append("doop")
    assert_equal nil, @list_1.head.next_node
  end

  def test_it_can_count_the_elements_it_contains
    @list_1.append("doop")
    assert_equal 1, @list_1.count
  end

  def test_it_can_create_a_string_with_elements_it_contains
    @list_1.append("doop")
    assert_equal "doop", @list_1.to_string
  end

  def test_it_can_append_to_list_when_head_node_exists
    @list_1.append("doop")
    @list_1.append("deep")

    assert_equal "doop", @list_1.head.data
    assert_equal "deep", @list_1.head.next_node.data
  end

  def test_it_can_count_all_elements_when_more_than_one_exists
    @list_1.append("1")
    @list_1.append("2")
    @list_1.append("3")
    @list_1.append("4")
    @list_1.append("5")
    @list_1.append("6")
    assert_equal 6, @list_1.count
  end
end





# > list.count
# => 2

# > list.to_string
# => "doop deep"
