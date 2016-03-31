class Node
  attr_reader :beat
  attr_accessor :next_node

  def initialize (beat, next_node= nil)
    @beat = beat
    @next_node = next_node
  end
end
