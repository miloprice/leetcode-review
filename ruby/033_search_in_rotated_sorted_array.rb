# Similar to binary search, with added cases that account for the rotated array.
# TODO: Works, but slowly (only beats 12.00% of submissions). Could use optimization on the logic.

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  return -1 unless nums.any?

  low = 0
  high = nums.length - 1
  mid = (high / 2)

  while low != high do
    low_num = nums[low]
    mid_num = nums[mid]
    high_num = nums[high]
    if mid_num == target
     return mid
   elsif low_num == target
      return low
    elsif high_num == target
      return high
    elsif (mid_num > target && low_num < target) ||   # mid_num is greater than target, and no wraparound
          (mid_num > target && high_num > mid_num) || # mid_num is greater than target, and high_num is greater still
          (mid_num < target && low_num > mid_num && low_num < target) # mid_num is less than target, but there is wraparound
      # Go left
      high = mid
      mid = low + ((high - low) / 2)
    else
      # Go right
      low = mid + 1
      mid = low + ((high - low) / 2)
    end
  end

  nums[low] == target ? low : -1
end
