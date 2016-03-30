# gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/node"

class NodeTest < Minitest::Test

  def setup
    @node_1 = Node.new("Bleep")
  end

  def test_nodes_can_be_created
    assert_equal Node, @node_1.class
  end

  def test_it_has_a_beat
    assert_equal "Bleep", @node_1.beat
  end

  def test_it_can_have_another_beat
    node_2 = Node.new("Boop")
    assert_equal Node, node_2.class
  end

  def test_it_has_next_node
    assert_equal nil, @node_1.next_node
  end


end
