# Overall strategy: Perform binary search on the rows until a row is found that could contain the target value (or return false if none exists), and then perform binary search on that row.  Runtime: O(log(m) + log(n)); no extra space
# Faster than 36.36% of submissions

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  return false unless matrix.any? && matrix[0].any?

  low = 0
  high = matrix.length - 1
  mid = (high / 2)

  while low != high do
    mid_row = matrix[mid]
    if mid_row[0] <= target && mid_row[-1] >= target
      target_row = mid_row
      break
    elsif mid_row[0] > target
      high = mid
      mid = low + ((high - low) / 2)
    else
      low = mid + 1
      mid = low + ((high - low) / 2)
    end
  end
  target_row ||= (matrix[mid] if matrix[mid][0] <= target && matrix[mid][-1] >= target)
  return false unless target_row

  low = 0
  high = target_row.length - 1
  mid = (high / 2)

  while low != high do
    if (mid_num = target_row[mid]) == target
      return true
    elsif mid_num > target
      high = mid
      mid = low + ((high - low) / 2)
    else
      low = mid + 1
      mid = low + ((high - low) / 2)
    end
  end
  target_row[mid] == target
end
