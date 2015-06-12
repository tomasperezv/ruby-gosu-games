##
# Author:: Tomas Perez (mailto:tom@0x101.com)
# This class represents the "Player" class that manages
# one kind of sprite.
#
class Player
  def initialize(window)
    @x = 200
    @y = 200
    @angle = 0
    @image = Gosu::Image(window, 'images/ship.png', false)
  end
end
