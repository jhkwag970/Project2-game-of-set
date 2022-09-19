
# String color: color of the card : red, green, purple
# Int num: number of the shape: 1,2,3
# String shape: shape of the card: diamond, oval, squiggles
# String shading: shade of the color: strip, solid, open

class Card
  attr_accessor :color, :num, :shape, :shading

  def initialize(color, num, shape, shading)
    @color = color
    @num = num
    @shape = shape
    @shading = shading
  end

  def toString
    puts "#{@color} #{@num} #{@shape} #{@shading}"
  end
end
