# One possibility: look back from each 0 to see if a sufficient prior jump length exists. This will be O(n^2) in the worst case, O(n) in the best case
# Another possibility: the tractability of each position is equivalent to the tractability of the following k positions, where k is the position's value. So for [3,2,1,0,4], the problem for 3 would reduce to whether [2,1,0,4], [1,0,4], and [0,4] were solvable. Further, we know that any position m spaces away in that window is only worth considering if its value is greater than k - m.

# Beats 55.56% of submissions
# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
    while nums[0] == 1
        nums.shift
    end
    if nums.length <= 1 || nums[0] >= nums.length - 1
        return true
    elsif nums[0] == 0
        return false
    end

    jump = nums[0]
    candidates = []
    (1..jump).each do |i|
        candidates << i if nums[i] && nums[i] > (jump - i)
    end
    candidates.any? {|c| can_jump(nums[c..-1])}
end
