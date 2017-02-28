require 'set'

ADJUST = -2 # Adjustment for potential_primes[0] == 2

# Faster than 44.44% of submissions
# @param {Integer} n
# @return {Integer}
def count_primes(n)
    potential_primes = (2...n).to_a
    sqrt = Math.sqrt(n)
    potential_primes.each do |p|
        if p && p > sqrt
            break
        elsif p
            multiple = p ** 2
            while multiple + ADJUST < n
                potential_primes[multiple + ADJUST] = nil
                multiple += p
            end
        end
    end

    potential_primes.compact.length
end
