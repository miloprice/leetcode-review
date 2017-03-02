# This can be done recursively by merging lists of the result of the function called on each node's descendants.

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# Faster than 84.62% of submissions
# @param {TreeNode} root
# @return {Integer[][]}
def level_order_bottom(root)
  if root.nil?
    []
  elsif root.left && root.right
    left_trav = level_order_bottom(root.left)
    right_trav = level_order_bottom(root.right)

    longer = [left_trav.length, right_trav.length].max

    # Iterating backwards, merge the right subtree's traversal into the left subtree's traversal.
    -1.downto(-longer).each do |i|
      if left_trav[i] && right_trav[i]
        left_trav[i] += right_trav[i]
      elsif right_trav[i]
        left_trav.unshift(right_trav[i])
      end
    end
    left_trav << [root.val]
  else
    child = root.left || root.right
    level_order_bottom(child) << [root.val]
  end
end
