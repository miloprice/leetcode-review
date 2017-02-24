# General strategy: Implement binary search, then once the values is found, move forward and backward from the value to find contiguous equal values.
# Runtime: O(log(n) + m), where n is the length of the array and m is the count of the target value
# Faster than 77.78% of submissions

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
    return [-1, -1] unless nums.any?

    low = 0
    high = nums.length - 1
    mid = (high / 2)
    
    while low != high do
        if (mid_num = nums[mid]) == target
            low = mid
            break
        elsif mid_num > target
            high = mid
            mid = low + ((high - low) / 2)
        else
            low = mid + 1
            mid = low + ((high - low) / 2)
        end
    end
    
    nums[low] == target ? found_range = [low, low] : (return [-1, -1])
    
    back_ind = low - 1
    while back_ind >= 0 && nums[back_ind] == target
        found_range[0] -= 1
        back_ind -= 1
    end
    
    fore_ind = low + 1
    while fore_ind < nums.length && nums[fore_ind] == target
        found_range[1] += 1
        fore_ind += 1
    end
    
    found_range
end
