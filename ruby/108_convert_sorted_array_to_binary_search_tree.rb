# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} nums
# @return {TreeNode}
# Faster than 66.67% of submissions
def sorted_array_to_bst(nums)
    if nums.length == 0
        nil
    elsif nums.length == 1
        TreeNode.new(nums[0])
    elsif nums.length == 2
        max_num = nums.max
        min_num = nums.min
        max_node = TreeNode.new(max_num)
        max_node.left = TreeNode.new(min_num)
        max_node
    else
        middle_index = nums.length / 2
        left_subarray = nums[0...middle_index]
        right_subarray = nums[middle_index + 1..-1]
        mid_node = TreeNode.new(nums[middle_index])
        mid_node.tap do |node|
            node.left = sorted_array_to_bst(left_subarray)
            node.right = sorted_array_to_bst(right_subarray)
        end
    end
end
