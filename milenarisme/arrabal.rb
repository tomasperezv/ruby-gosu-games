##
# Author:: Tomas Perez (mailto:tom@0x101.com)
# This class represents the "Arrabal" class that manages
# the Arrabal sprite.
#
class Arrabal
  ##
  # @param window [Window]
  # @return [void]
  def initialize(window)
    @x = 200
    @y = 200
    @velocity_x = 0
    @velocity_y = 0
    @angle = 0
    @image = Gosu::Image.new(window, './resources/arrabal.png', false)
  end

  ##
  # @return [void]
  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  ##
  # @return [void]
  def turn_right
    @angle += 3
  end

  ##
  # @return [void]
  def turn_left
    @angle -= 3
  end

  ##
  # @return [void]
  def accelerate
    @velocity_x += Gosu.offset_x(@angle, 2)
    @velocity_y += Gosu.offset_y(@angle, 2)
  end

  def move
    @x += @velocity_x
    @y += @velocity_y
    # Slow it down like a sort of friction
    @velocity_x *= 0.9
    @velocity_y *= 0.9
  end

end
