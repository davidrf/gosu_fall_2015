class Ball
  IMAGE = 'images/ball.png'
  attr_accessor :x_coordinate, :y_coordinate, :z_coordinate, :image,
                :x_velocity, :y_velocity
  def initialize(x_coordinate, y_coordinate)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @z_coordinate = 0
    @x_velocity = 1.5
    @y_velocity = -3.5
    @image = Gosu::Image.new(IMAGE)
  end

  def top_edge
    y_coordinate - image.height / 2
  end

  def bottom_edge
    y_coordinate + image.height / 2
  end

  def right_edge
    x_coordinate + image.width / 2
  end

  def left_edge
    x_coordinate - image.width / 2
  end

  def update(paddle)
    if right_edge >= GameWindow::SCREEN_WIDTH || left_edge <= 0
      self.x_velocity = x_velocity * -1
    end
    if top_edge <= 0
      self.y_velocity = y_velocity * -1
    end
    if bottom_edge >= paddle.top_edge && right_edge >= paddle.left_edge && left_edge <= paddle.right_edge
      self.y_velocity = y_velocity * -1
    end
    self.x_coordinate = x_coordinate + x_velocity
    self.y_coordinate = y_coordinate + y_velocity
  end

  # def bottom_collision(paddle)
    # bottom_edge >= paddle.top_edge &&
    # right_edge >= paddle.left_edge &&
    # left_edge <= paddle.right_edge
  # end

  def draw
    x_adjusted_coordinate = x_coordinate - (image.width / 2)
    y_adjusted_coordinate = y_coordinate - (image.height / 2)
    z_coordinate = 0
    image.draw(x_adjusted_coordinate, y_adjusted_coordinate, z_coordinate)
  end
end

