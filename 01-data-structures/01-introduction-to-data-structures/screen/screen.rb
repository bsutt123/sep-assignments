require_relative 'pixel'

class Screen
  attr_reader :width
  attr_reader :height
  attr_reader :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = Array.new(height) { Array.new(width, Pixel.new(0,0,0)) }
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x,y) && pixel.class.name == "Pixel"
      @matrix[y][x] = pixel
    end
  end

  def at(x, y)
    if inbounds(x,y)
      @matrix[y][x]
    end
  end

  private

  def inbounds(x, y)
    x >= 0 && y >= 0 && y <= @height && x <= @width
  end

end