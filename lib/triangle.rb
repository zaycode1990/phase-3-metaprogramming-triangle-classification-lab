require "pry"

class Triangle

  attr_reader :a, :b, :c
  
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    [a, b, c].permutation do |sides|
      raise TriangleError unless sides[0] + sides[1] > sides[2]
    end
    case [a,b,c].uniq.size
      when 3; :scalene
      when 2; :isosceles
      when 1; :equilateral
    end
  end
  
  class TriangleError < StandardError
  end

end