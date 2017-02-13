# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# The idea here is to use breadth-first search, and then verify symmetric order each time the queue is re-populated.
# @param {TreeNode} root
# @return {Boolean}
# Faster than 72.72% of solutions
def is_symmetric_iterative(root)
    queue = []
    queue << root
    while queue.any?
        vals = queue.map{|node| node && node.val}
        return false if vals != vals.reverse    # TODO: could be more efficient(?)
        row_size = queue.size
        row_size.times do
            node = queue.shift
            queue += [node.left, node.right] if node
        end
    end
    true
end

# The idea here is to get the in-order traversal of the tree, and then verify that it's symmetrical
# Faster than 9.09% of solutions
def is_symmetric_preorder(root)
    def preorder(root, layer)
        if root.nil?
            [layer]
        else
            preorder(root.left, layer + 1) + [root.val + layer] + preorder(root.right, layer + 1)
        end
    end

    preorder_traversal = preorder(root, 0)
    preorder_traversal == preorder_traversal.reverse
end

# Mirror function (after reading suggested solution)
# Slow!
def is_symmetric_recursive(root)
    def is_mirror(t1, t2)
        return true unless t1 || t2
        return false unless t1 && t2
        (t1.val == t2.val) && is_mirror(t1.left, t2.right) && is_mirror(t1.right, t2.left)
    end

    root.nil? || is_mirror(root.left, root.right)
end

# Iterative function based on suggested solution.
# Runtime seems variable; not sure if this is due to site issues.
def is_symmetric_iterative_2(root)
    return true unless (root && (root.left || root.right))
    queue = []
    queue << root.left << root.right
    while queue.any?
        node1, node2 = queue.shift(2)
        next unless node1 || node2
        return false unless node1 && node2 && node1.val == node2.val
        queue << node1.left << node2.right << node1.right << node2.left
    end
    true
end
