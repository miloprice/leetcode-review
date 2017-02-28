require 'set'

# Faster than 46.67% of submissions
# @param {Integer} n
# @return {Boolean}
def is_happy(n)
  prev_found = Set.new([])
  sum_squares = n
  while sum_squares != 1
    sum_squares = sum_squares.to_s.split('').map{|d| d.to_i ** 2}.inject(0, &:+)  # Using inject since Enumerable#sum apparently not available in non-Rails Ruby
    if prev_found.include? sum_squares
      return false
    else
      prev_found.add(sum_squares)
    end
  end

  true
end
