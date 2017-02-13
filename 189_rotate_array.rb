# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
# Faster than 9.09% of solutions
def rotate_iterative(nums, k)
    k = k % nums.length
    return if k == 0
    k.times do
        nums.unshift(nums.pop)
    end
    return
end

# The "correct" answer. Faster than 100% of solutions.
def rotate_builtin(nums, k)
    nums.rotate!(-k)
end

# Faster than 54.55% of solutions
def rotate_slice(nums, k)
    k = k % nums.length
    return if k == 0

    nums.unshift(nums[nums.length - k..-1]).flatten!
    nums.slice!(nums.length - k..-1)
    return nums
end
