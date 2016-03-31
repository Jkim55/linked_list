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
    assert_equal "deep", jb.list.head.beat
    assert_equal "doo", jb.list.head.next_node.beat
  end

  def test_jungle_bests_can_play_beats
    jb = JungleBeat.new
    jb.append("deep dop dop deep")
    jb.play
  end

  def test_it_can_have_an_diff_voice
    # skip
    jb = JungleBeat.new

    jb.append("deep dop dop deep")
    jb.rate = 100
    jb.voice = "Alice"

    assert_equal 100, jb.rate
    assert_equal "Alice", jb.voice
    jb.play

    assert_equal 500, jb.reset_rate
    assert_equal "Boing", jb.reset_voice

    jb.play

  end

end


# -----------------Extension-------------------
# > jb = JungleBeat.new("deep dop dop deep")

# > jb.play
# => 4 # plays the four sounds normal speed with Boing voice

# > jb.rate = 100
# => 100
#
# > jb.play
# => 4 # plays the four sounds slower with Boing voice
#
# > jb.voice = "Alice"
# => "Alice"
#
# > jb.play
# => 4 # plays the four sounds slower with Alice voice
#
# > jb.reset_rate
# => 500
#
# > jb.reset_voice
# => "Boing"
#
# > jb.play
# => 4 # plays the four sounds normal speed with Boing voice
