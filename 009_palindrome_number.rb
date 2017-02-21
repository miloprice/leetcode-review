# General strategy: first determine the length of the number (decimally, since we're looking for decimal palindromes) and then compare the largest figure with the smallest figure, etc.
# Find the smaller and larger figures by modding each number by the next larger figure (to eliminate larger figures), and then dividing by 10 to the power of the index (to get just the digit and eliminate smaller figures).

# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if x < 0
  return true if x == 0

  x_length = (Math.log10(x) + 1).floor    # It's apparently faster to do this manually, but this is more readable/idiomatic
  (0...x_length/2).each do |idx|
      low_num = (x % 10 ** (idx + 1)) / 10 ** idx
      high_num = ((x % 10 ** (x_length - idx)) / 10 ** (x_length - idx - 1))
      return false if low_num != high_num
  end

  true
end
