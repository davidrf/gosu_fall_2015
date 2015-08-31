class Paddle
  IMAGE = 'images/paddle.png'
  attr_accessor :x_coordinate
  attr_reader :y_coordinate, :z_coordinate, :image
  def initialize(x_coordinate, y_coordinate)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @z_coordinate = 0
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

  def draw
    x_adjusted_coordinate = x_coordinate - (image.width / 2)
    y_adjusted_coordinate = y_coordinate - (image.height / 2)
    z_coordinate = 0
    image.draw(x_adjusted_coordinate, y_adjusted_coordinate, z_coordinate)
  end
end
