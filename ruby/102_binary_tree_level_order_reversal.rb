# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# Faster than 55.00% of submissions
# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
  if root.nil?
    []
  elsif root.left && root.right
    left_trav = level_order(root.left)
    right_trav = level_order(root.right)

    # Iterating forwards, merge the right subtree's traversal into the left subtree's traversal.
    right_trav.each_with_index do |n, i|
      if left_trav[i]
        left_trav[i] += right_trav[i]
      else
        left_trav[i] = right_trav[i]
      end
    end
    [[root.val]] + left_trav
  else
    child = root.left || root.right
    [[root.val]] + level_order(child)
  end
end
