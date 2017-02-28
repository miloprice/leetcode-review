# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# Faster than 16.67% of submissions
# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
  def validate_recursive(node, lower_bound, upper_bound)
    return true unless node
    if (lower_bound.nil? || node.val > lower_bound) && (upper_bound.nil? || node.val < upper_bound) && (node.left.nil? || node.left.val < node.val) && (node.right.nil? || node.right.val > node.val)
      left_upper_bound = (upper_bound.nil? ? node.val : [upper_bound, node.val].min)
      right_lower_bound = (lower_bound.nil? ? node.val : [lower_bound, node.val].max)
      validate_recursive(node.left, lower_bound, left_upper_bound) && validate_recursive(node.right, right_lower_bound, upper_bound)
    else
      false
    end
  end

  validate_recursive(root, nil, nil)
end
