class Vector2
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def *(number)
    case number
    when Numeric
      puts "(#{@x * number}, #{@y * number})"
    when Vector2
      puts "(#{@x * number.x + @y * number.y})"
    else
      puts "Não permitido"
    end
  end

  def coerce(number)
    [self, number]
  end
end

v = Vector2.new(3, 4)

puts v * 2 # Output: (6, 8)
puts v * 2.5 # Output: (7.5, 10.0)
puts v * v # Output: 25 (dot product)
puts 2 * v # Output: (6, 8)
puts 2.5 * v # Output: (7.5, 10.0)
