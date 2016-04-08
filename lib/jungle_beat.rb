require "./lib/linked_list"

class JungleBeat
  attr_accessor :list, :rate, :voice

  def initialize
    @list = LinkedList.new
    @rate = 500
    @voice = "Boing"
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
     `say -r #{rate} -v #{voice} #{beats}`
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = "Boing"
  end
end
