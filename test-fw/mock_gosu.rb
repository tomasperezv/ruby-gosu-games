# Author:: Tomas Perez (mailto:tom@0x101.com)
module Gosu

  ##
  # https://www.libgosu.org/rdoc/Gosu/Window.html
  class Window

    attr_reader :width, :height, :update_interval, :mouse_x, :mouse_y

    def caption=(string); end

    def initialize(width, height, fullscreen, update_interval=1.0/60.0)
    end

  end

  ##
  # https://www.libgosu.org/rdoc/Gosu/Image.html
  #
  class Image
    def initialize(window, source, tileable = false); end
  end

end
