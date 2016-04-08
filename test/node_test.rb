require 'minitest/autorun'
require 'minitest/pride'
require "./lib/node"

class NodeTest < Minitest::Test

  def setup
    @node = Node.new("Bleep")
  end

  def test_nodes_can_be_created
    assert_equal Node, @node.class
  end

  def test_it_has_a_beat
    assert_equal "Bleep", @node.beat
  end

  def test_it_can_have_a_different_beat
    node = Node.new("Boop")
    assert_equal Node, node.class
  end

  def test_it_has_next_node
    assert_equal nil, @node.next_node
  end
end
