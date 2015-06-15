##
# Author:: Tomas Perez (mailto:tom@0x101.com)
# This class represents the "Milenarisme" window that
# contains the game.
#
class Milenarisme < Gosu::Window

  ##
  # @return [void]
  def initialize
    super 800, 600, false
    self.caption = "Sector Five"
    @arrabal = Arrabal.new(self)
  end

  ##
  # @return [void]
  def draw
    @arrabal.draw
  end

  ##
  # @return [void]
  def update

    if button_down?(Gosu::KbLeft)
      @arrabal.turn_left
    end

    if button_down?(Gosu::KbRight)
      @arrabal.turn_right
    end

    if button_down?(Gosu::KbUp)
      @arrabal.accelerate
    end

    if button_down?(Gosu::KbDown)
      @arrabal.slow_down
    end

    @arrabal.move

  end

end
