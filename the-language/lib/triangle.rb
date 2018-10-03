# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def calculate_if_longest_side_biggar_than_sum_of_other_sides?(sides)
  longest_side = sides.max
  sides.delete_at(sides.index(longest_side))
  sides[0] + sides[1] <= longest_side
end


def triangle(a, b, c)
  if a < 1 || b < 1 || c < 1
    raise TriangleError.new("Plebs")
  elsif calculate_if_longest_side_biggar_than_sum_of_other_sides?([a, b, c])
    raise TriangleError.new("More plebs")
  elsif a == b && b == c
    :equilateral
  elsif a == b || b == c || a == c
    :isosceles
  else
    :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end

