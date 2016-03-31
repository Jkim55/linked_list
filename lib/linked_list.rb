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
      new_node = Node.new(beat)
      current_node.next_node = new_node
      new_node.beat
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

  def prepend(beat)
    if @head.nil?
      @head = Node.new(beat)
    else
      head = Node.new(beat)
      head.next_node = @head
      @head = head
    end
    beat
  end

  def insert(position, data)
    if @head.nil?
      @head = Node.new(data)
    else
      counter = 0
      current_node = @head

      until counter == position
        counter += 1
        previous = current_node
        current_node = current_node.next_node
      end

      new_node = Node.new(data)
      previous.next_node = new_node
      new_node.next_node = current_node
    end
    new_node.beat
  end

  def find(index, nodes)
    if index.class != Fixnum || nodes.class != Fixnum
      return nil
    else
      current_node = @head
      counter = 0
      found_elements = ""
      until counter == index.abs
        counter +=1
        current_node = current_node.next_node
      end
    end
    (nodes.abs).times do
      found_elements += current_node.beat + " "
      current_node = current_node.next_node
    end
    found_elements.chop
  end

  def includes?(beat)
    if beat.class != String
      return nil
    else
      current_node = @head
      includes = false
      until current_node.beat == beat || current_node.next_node == nil
        current_node = current_node.next_node
        includes = true if current_node.beat == beat
      end
    end
    includes
  end

  def pop
    if @head == nil
      nil
    else
      current_node = @head
      until current_node.next_node.next_node == nil
        current_node = current_node.next_node
      end
    end
    popped_node = current_node.next_node.beat
    current_node.next_node = nil
    popped_node
  end
end
