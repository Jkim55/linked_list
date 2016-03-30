require_relative "node"

class LinkedList
attr_accessor :head, :total_beats

  def initialize
    @head = nil
    @total_beats = []
  end


  def append(beat)
  @total_beats << beat
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
    if @total_beats == nil
      nil
    else
      @total_beats.join(" ")
    end
    # string = @head.beat + " "
    # current_node = @head
    # until current_node.next_node == nil
    #   current_node = current_node.next_node
    #   string += current_node.beat + " "
    # end
    # string.chop
  end

  def prepend(beat)
  @total_beats.unshift(beat)
    if @head.nil?
      @head = Node.new(beat)
    else
      head = Node.new(beat)
      head.next_node = @head
      @head = head
    end
    beat
    # if @head == nil
    #   @head = Node.new(beat)
    #   @head.beat
    # else
    #   current_node = @head
    #   @head = Node.new(beat)
    #   @head.next_node = current_node
    #   @head.beat
    # end
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
    @total_beats.insert(position,data)
    new_node.beat
    # new_node.beat
  end


end
