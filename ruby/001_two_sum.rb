# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    matches = {}
    # Set up hash table of index locations
    nums.each_with_index do |n, i|
        matches[n] ? matches[n] << i : matches[n] = [i]
        
        complement = target - n
        if complement == n  # If the number is half of the target value
            return matches[n] if matches[n].size == 2     # bit of a trick here--these sums are unique, so we can return iff v.size == 2 
        elsif matches[complement]
            return matches[n] + matches[complement]
        end
    end
end
