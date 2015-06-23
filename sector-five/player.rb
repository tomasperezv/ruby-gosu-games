##
# Author:: Tomas Perez (mailto:tom@0x101.com)
# This class represents the "Player" class that manages
# the Player sprite.
#
class Player

  ROTATION_SPEED = 3
  ACCELERATION = 2
  FRICTION = 0.9

  ##
  # @param window [Window]
  # @return [void]
  def initialize(window)
    @x = 200
    @y = 200
    @velocity_x = 0
    @velocity_y = 0
    @angle = 0
    @image = Gosu::Image.new(window, './resources/images/ship.png', false)
    @radius = 20
    @window = window
  end

  ##
  # @return [void]
  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  ##
  # @return [void]
  def turn_right
    @angle += ROTATION_SPEED
  end

  ##
  # @return [void]
  def turn_left
    @angle -= ROTATION_SPEED
  end

  ##
  # @return [void]
  def accelerate
    @velocity_x += Gosu.offset_x(@angle, ACCELERATION)
    @velocity_y += Gosu.offset_y(@angle, ACCELERATION)
  end

  def move
    @x += @velocity_x
    @y += @velocity_y
    # Slow it down like a sort of friction
    @velocity_x *= FRICTION
    @velocity_y *= FRICTION

    if @x > @window.width - @radius
      @vx = 0
      @x = @window.width - @radius
    end

    if @x < @radius
      @vx = 0
      @x = @radius
    end

    if @y > @window.height - @radius
      @vy = 0
      @y = @window.height - @radius
    end
  end

end
