require_relative "linked_list"
require 'pry'

class JungleBeat
  def initialize
    @list = LinkedList.new
  end

  def append(arg)
    beats = arg.split
    beats.each do |beat|
      @list.append(beat)
    end
  end

  def count
    @list.count
  end

  def play
    beats = @list.to_string
     `say -r 500 -v Boing #{beats}`
  end

end
