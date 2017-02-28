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
# Faster than 58.33% of submissions
def sum_numbers(root)
    return 0 unless root
    node_stack = [[root, 0]]
    total = 0
    while node_stack.any?
        node, partial_total = node_stack.pop
        inclusive_total = partial_total * 10 + node.val
        if node.left.nil? && node.right.nil?
            total += inclusive_total
        else
            node_stack << [node.left, inclusive_total] if node.left
            node_stack << [node.right, inclusive_total] if node.right
        end
    end
    total
end
