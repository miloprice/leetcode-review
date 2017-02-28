# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def min_depth(root, depth=0)
    if root.nil?
        0
    elsif root.left.nil? && root.right.nil?
        depth + 1
    elsif root.left.nil? || root.right.nil?
        min_depth(root.left, depth + 1) + min_depth(root.right, depth + 1)
    else
        depths = []
        depths << min_depth(root.left, depth + 1) if root.left
        depths << min_depth(root.right, depth + 1) if root.right
        depths.min
    end
end
