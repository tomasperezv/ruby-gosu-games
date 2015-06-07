require "../test-fw/mock_gosu.rb"
require "./whack_a_ruby.rb"
require "test/unit"

##
# Author:: Tomas Perez (mailto:tom@0x101.com)
class TestGame < Test::Unit::TestCase
  def test_init()
    window = WhackARuby.new
    assert_equal(window.width, 50)
    assert_equal(window.height, 43)
  end
end
