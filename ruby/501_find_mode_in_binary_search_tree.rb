# Faster than 35.00% of submissions :(

# @param {TreeNode} root
# @return {Integer[]}
def find_mode(root)
  modes = Hash.new(0)
  node_queue = [root]
  while node_queue.any?
    node = node_queue.shift
    modes[node.val] += 1
    node_queue << node.left if node.left
    node_queue << node.right if node.right
  end

  max_count = modes.map{|_, count| count}.max
  modes.select{|_, count| count == max_count}.map{|value, _| value}
end
