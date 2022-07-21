require "pry"

class Triangle
  attr_reader :side_1, :side_2, :side_3
  
  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def kind
    validate_triangle
    if side_1 == side_2 && side_2 == side_3
      :equilateral
    elsif side_1 == side_2 || side_2 == side_3 || side_1 == side_3
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    [side_1, side_2, side_3].all?(&:positive?)
  end

  def two_sides_are_greater?
    side_1 + side_2 > side_3 && side_1 + side_3 > side_2 && side_2 + side_3 > side_1
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && two_sides_are_greater?
  end

  class TriangleError < StandardError
  end

end