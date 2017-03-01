# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# Iterative; faster than 100.0% of submissions (first try!)
# @param {TreeNode} root
# @return {Integer[]}
def postorder_traversal(root)
    node_stack = [root]
    result = []
    while node_stack.any?
        node = node_stack[-1]
        if node.left || node.right
            node_stack << node.right if node.right
            node_stack << node.left if node.left
            node.left = nil
            node.right = nil
        else
            node_stack.pop
            result << node.val
        end
    end
    
    result
end
