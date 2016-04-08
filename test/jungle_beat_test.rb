require 'minitest/autorun'
require 'minitest/pride'
require "./lib/jungle_beat"

class JungleBeatTest < Minitest::Test

  def test_it_can_append_beats
    jb = JungleBeat.new
    jb.append("deep doo ditt")
    assert_equal 3, jb.count
    assert_equal "deep doo ditt", jb.append("deep doo ditt").join(" ") #@list.to_string
    assert_equal "deep", jb.list.head.beat
    assert_equal "doo", jb.list.head.next_node.beat
  end

  def test_jungle_bests_can_play_beats
    jb = JungleBeat.new
    jb.append("ding, dah, oom, oom, ding, oom, oom, oom")

    jb.play
  end

  def test_it_can_make_jokes_in_different_voices_and_return_to_default_voice
    jb_1 = JungleBeat.new
    jb_2 = JungleBeat.new
    jb_3 = JungleBeat.new
    jb_4 = JungleBeat.new
    jb_5 = JungleBeat.new

    jb_1.append("Knock-knock")
    jb_1.rate = 200
    jb_1.voice = "Victoria"
    jb_1.play

    jb_2.append("Whos there")
    jb_2.rate = 180
    jb_2.voice = "Alex"
    jb_2.play

    jb_3.append("Two")
    jb_3.rate = 200
    jb_3.voice = "Victoria"
    jb_3.play

    jb_4.append("Two Who")
    jb_4.rate = 180
    jb_4.voice = "Alex"
    jb_4.play

    jb_5.append("Two whom")
    jb_5.rate = 80
    jb_5.voice = "Victoria"

    assert_equal 80, jb_5.rate
    assert_equal "Victoria", jb_5.voice
    jb_5.play

    jb_5.append("Hehhh heee hehehhehehhe heheh heee heeh hehe")
    assert_equal 500, jb_5.reset_rate
    assert_equal "Boing", jb_5.reset_voice
    jb_5.play

  end
end
