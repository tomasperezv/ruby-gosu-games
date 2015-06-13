##
# Author:: Tomas Perez (mailto:tom@0x101.com)
# This class represents the "SectorFive" window that
# contains the game.
#
class SectorFive < Gosu::Window

  ##
  # @return [void]
  def initialize
    super 800, 600, false
    self.caption = "Sector Five"
    @player = Player.new(self)
  end

  ##
  # @return [void]
  def draw
    @player.draw
  end

end
