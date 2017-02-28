# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Boolean}
# Faster than 77.78% of submissions
def is_balanced(root)
    def height_and_balanced(root, height)
        if root.nil?
            [0, true]
        else
            height_left = height_and_balanced(root.left, height)
            height_right = height_and_balanced(root.right, height)
            diff = height_left[0] - height_right[0]
            balanced = (-1 <= diff && diff <= 1)
            [[height_left[0], height_right[0]].max + 1, balanced && height_left[1] && height_right[1]]
        end
    end

    height_and_balanced(root, 0)[1]
end
