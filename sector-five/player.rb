##
# Author:: Tomas Perez (mailto:tom@0x101.com)
# This class represents the "Player" class that manages
# the Player sprite.
#
class Player
  ##
  # @param window [Window]
  # @return [void]
  def initialize(window)
    @x = 200
    @y = 200
    @angle = 0
    @image = Gosu::Image.new(window, './resources/images/ship.png', false)
  end

  ##
  # @return [void]
  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
