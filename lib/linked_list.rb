require_relative "node"

class LinkedList
attr_accessor :head

  def initialize
    @head = nil
  end


  def append(beat)
    if @head == nil
      @head = Node.new(beat)
      @head.beat
    else
      current_node = @head
      until current_node.next_node == nil
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(beat)
      current_node.beat
    end
  end

  def count
    counter = 0
    current_node = @head
    if current_node != nil
      counter += 1
      until current_node.next_node == nil
        current_node = current_node.next_node
        counter += 1
      end
    end
    counter
  end

  def to_string
    string = @head.beat + " "
    current_node = @head
    until current_node.next_node == nil
      current_node = current_node.next_node
      string += current_node.beat + " "
    end
    string.chop
  end
end
