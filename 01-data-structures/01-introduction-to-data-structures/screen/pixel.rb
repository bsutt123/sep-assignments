# Pixels require three color values: red, green, and blue.
# Pixel colors red, green, and blue values must be greater than zero and less than 255.
# If  a value less than zero is specified, default to zero. If a value greater than 255 is specified, default to 255.

# Pixels also require a coordinate location: x and y.

class Pixel
  attr_reader :red
  attr_reader :green
  attr_reader :blue


  def initialize(red, green, blue)
    @red = validate_color(red)
    @blue =  validate_color(blue)
    @green = validate_color(green)
  end

  def set_red(color)
    @red = validate_color(color)
  end

  def set_blue(color)
    @blue = validate_color(color)
  end

  def set_green(color)
    @green = validate_color(color)
  end


  private

  def validate_color(color)
    if color > 255
      255
    elsif color < 0
      0
    else
      color
    end
  end

end
