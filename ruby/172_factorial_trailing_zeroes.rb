# Strategy: Trailing 0s will only come from either numbers <= n that themselves end in 0, or from the multiplication of a number ending in 5 with a number ending in 2. Since any number ending in 5 will necessarily multiply with a number ending in 2 during the factorial process, you can figure out the number of trailing zeroes by the number of numbers ending in 5 less than the given number. Note that multiples of 5 (eg 25) provide multiple 5s, so the result should be divided by 5 again to see if any powers of 5 are less than the given number.

# Faster than 85.71% of submissions
# @param {Integer} n
# @return {Integer}
def trailing_zeroes(n)
    result = 0
    more_5s = n / 5
    while more_5s > 0
        result += more_5s
        more_5s /= 5
    end
    
    result
end
