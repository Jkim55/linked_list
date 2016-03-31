# gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/junglebeat"
require 'pry'

class JungleBeatTest < Minitest::Test
 def test_it_can_append_beats
  jb = JungleBeat.new
  jb.append("deep doo ditt")
  assert_equal 3, jb.count
  # binding.pry
  assert_equal "deep doo ditt", jb.append("deep doo ditt").join(" ") #@list.to_string
 end


end



# > require "./lib/jungle_beat"
# > jb = JungleBeat.new
# => <JungleBeat list=<LinkedList head=nil #234567890890> #456789045678>
# > jb.list
# => <LinkedList head=nil #234567890890>
# > jb.list.head
# => nil
# > jb.append("deep doo ditt")
# => "deep doo ditt"
# > jb.list.head.data
# => "deep"
# > jb.list.head.next_node.data
# => "doo"
# > jb.append("woo hoo shu")
# => "woo hoo shu"
# > jb.count
# 6

# > beats = "ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom "
# > `say -r 500 -v Boing #{beats}`
