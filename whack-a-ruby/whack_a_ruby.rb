#!/usr/bin/ruby -w
require 'gosu'

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
class WhackARuby < Gosu::Window
  def initialize
    super 800,600,false
    self.caption = "Whack the Ruby!"
    @image = Gosu::Image.new(self, './resources/ruby.png', false)
    @x = 200
    @y = 200
    @width = 50
    @height = 43
    @velocity_x = 5
    @velocity_y = 5
  end

  def update
    @x += @velocity_x
    @y += @velocity_y

    if @x + @width/2 > 800 or @x - @width/2 < 0
      @velocity_x *= -1
    end

    if @y + @height/2 > 600 or @y - @height/2 < 0
      @velocity_y *= -1
    end

  end

  def draw
    @image.draw(@x-@width/2, @y-@height/2, 1)
  end

end

window = WhackARuby.new
window.show
