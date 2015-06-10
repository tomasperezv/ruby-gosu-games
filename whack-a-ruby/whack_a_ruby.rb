##
# Author:: Tomas Perez (mailto:tom@0x101.com)
# This class represents the "WhackARuby" window that
# contains the game.
#
# ==== Attributes
# * +x+ - The current position x of the image
# * +y+ - The current position y of the image
# * +width+ - Width of the image
# * +height+ - Height of the image
# * +velocity_x+ - x axis speed
# * +velocity_y+ - y axis speed
# * +visible+ - Defines if the image is visible
# * +hit+ - Keep track of the hits
# * +playing+ - Boolean that defines if the game is running
class WhackARuby < Gosu::Window

  ##
  # @return [void]
  def initialize
    $gosu_gl_blocks = nil

    super 800,600,false
    self.caption = "Whack the Ruby!"

    @init = true

    @hammer_image = Gosu::Image.new(self, './resources/hammer.png', false)
    @image = Gosu::Image.new(self, './resources/arrabal.png', false)
    @background = Gosu::Image.new(self, './resources/background.jpg', true)

    @x = 200
    @y = 200
    @width = 50
    @height = 43
    @velocity_x = 2
    @velocity_y = 2
    @visible = 0
    @hit = 0

    @font = Gosu::Font.new(self, "system", 30)
    @score = 0
    @playing = true

  end

  ##
  # @param id [Fixnum] the button's platform defined id.
  # @see Gosu.button_down?
  def button_down(id)
    if (@playing and id == Gosu::MsLeft)
      if Gosu.distance(mouse_x, mouse_y, @x, @y) < 50 and @visible >= 0
        @hit = 1
        @score += 5
      else
        @hit = -1
        @score -= 1
      end
    end
  end

  ##
  # This method is called once very {#update_interval} milliseconds while the window is
  # being shown. Contains the application main's logic.
  #
  # @return [void]
  def update
    if @playing
      @x += @velocity_x
      @y += @velocity_y
      @visible -= 1

      if @visible < -10 and rand < 0.01
        @visible = 300
      end

      if @x + @width > 800 or @x - @width < 0
        @velocity_x *= -1
      end

      if @y + @height > 600 or @y - @height < 0
        @velocity_y *= -1
      end

      # Time limit
      @time_left = (100 - (Gosu.milliseconds/1000)).to_s

      if @time_left == 0
        @playing = false
      end
    end
  end

  ##
  # Called after every update and whenever the OS wants the window to repaint itself.
  # It contains application's rendering code.
  #
  # @return [void]
  def draw

    if @init
      @background.draw(0, 0, -1, 2.5, 2.5)
    end

    if not @playing
      @font.draw("Game Over", 300, 300, 3)
      @visible = 20
    end

    @hammer_image.draw(mouse_x-40, mouse_y-10, 2)

    if @visible > 0
      @image.draw(@x-@width/2, @y-@height/2, 1)
    end

    if @hit == 0
      c = Gosu::Color::NONE
    elsif @hit == 1
      c = Gosu::Color::GREEN
    elsif @hit == -1
      c = Gosu::Color::RED
    end
    @hit = 0

    draw_quad(0, 0, c, 800, 0, c, 800, 600, c, 0, 600, c)

    @font.draw(@score.to_s, 700, 20, 2)
    @font.draw(@time_left, 20, 20, 2)

  end

end


