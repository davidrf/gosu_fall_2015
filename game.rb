require 'pry'
require 'gosu'

require_relative 'game_window'
require_relative 'paddle'
require_relative 'ball'

game_window = GameWindow.new
game_window.show

# class Gosu::Window
  # def initialize(width, height)
    # @width = width
    # @height = height
  # end
# end

# class GameWindow < Gosu::Window
  # def initialize
    # super(600, 900)
  # end
# end
