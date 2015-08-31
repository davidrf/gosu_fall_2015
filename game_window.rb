class GameWindow < Gosu::Window
  SCREEN_WIDTH = 600
  SCREEN_HEIGHT = 900
  attr_accessor :view
  attr_reader :menu_font, :paddle, :ball
  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT)
    @menu_font = Gosu::Font.new(50)
    @view = :menu
    @paddle = Paddle.new(SCREEN_WIDTH / 2, 700)
    @ball = Ball.new(SCREEN_WIDTH / 2, 500)
  end

  def draw
    if view == :menu
      menu_draw
    else
      paddle.draw
      ball.draw
    end
  end

  def update
    close if button_down?(Gosu::KbEscape)
    if view == :menu
      if button_down?(Gosu::KbA)
        self.view = :game
      end
    elsif view == :game
      paddle.x_coordinate = mouse_x
      ball.update(paddle)
    end
  end

  def menu_draw
    text = "Press 'a' to Play"
    x_coordinate = (SCREEN_WIDTH / 2) - (menu_font.text_width(text) / 2)
    y_coordinate = SCREEN_HEIGHT / 2
    z_coordinate = 0
    menu_font.draw(text, x_coordinate, y_coordinate , z_coordinate)
  end
end
