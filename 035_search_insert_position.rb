# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
# Faster than 95.00% of submissions (just standard binary search)
def search_insert(nums, target)
  low = 0
  high = nums.length - 1
  mid = (high / 2)

  while low != high do
    if (mid_num = nums[mid]) == target
      return mid
    elsif mid_num > target
      high = mid
      mid = low + ((high - low) / 2)
    else
      low = mid + 1
      mid = low + ((high - low) / 2)
    end
  end

  nums[low] < target ? low + 1 : low
end
