require_relative "node"

class LinkedList
attr_accessor :head

  def initialize
    @head = nil
  end


  def append(data)
    if @head == nil
      @head = Node.new(data)
      @head.data
    else
      current_node = @head
      until current_node.next_node == nil
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(data)
      current_node.data
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

  # def count  #this is WRONG!!!!!!!!!!!!!!!
  #   counter = 0
  #  if @head != nil
  #    counter += 1
  #  else
  #  end
  #  counter
  # end

  def to_string
    @head.data
  end
end
