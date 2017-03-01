# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# Iterative; faster than 77.78% of submissions
# @param {TreeNode} root
# @return {Integer[]}
def preorder_traversal(root)
    node_stack = [root]
    result = []
    while node_stack.any?
        node = node_stack.pop
        result << node.val
        node_stack << node.right if node.right
        node_stack << node.left if node.left
    end

    result
end
