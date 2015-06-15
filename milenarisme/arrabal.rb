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
    @x = 88
    @y = 108
    @velocity_x = 0
    @velocity_y = 0
    @angle = 0
    @image = Gosu::Image.new(window, './resources/arrabal.png', false)
  end

  ##
  # @return [void]
  def draw

    if @x > 800 or @x < 0
      @velocity_x = @velocity_x*-2
    end

    if @y > 600 or @y < 0
      @velocity_y = @velocity_y*-2
    end

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

  ##
  # @return [void]
  def slow_down
    @velocity_x -= Gosu.offset_x(@angle, 2)
    @velocity_y -= Gosu.offset_y(@angle, 2)
  end

  ##
  # @return [void]
  def move
    @x += @velocity_x
    @y += @velocity_y
    # Slow it down like a sort of friction
    @velocity_x *= 0.9
    @velocity_y *= 0.9
  end

end
