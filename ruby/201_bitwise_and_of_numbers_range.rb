
# Faster than 100.00% of submissions
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def range_bitwise_and(m, n)
  # If n is a "place" larger than m (i.e., if there is a power of 2 between m and n) then there will be no overlap
  power_of_2 = 1
  power_of_2 *= 2 while power_of_2 <= m
  return 0 if power_of_2 <= n

  result = m
  (m+1..n).each do |num|
    result &= num
  end
  result
end
