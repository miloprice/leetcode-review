# The idea here is to use two pointers, such that one pointer is on the edge of the two sections, and the other is moving forward and traversing the list. If a new node is greater than or equal to x, leave it alone; otherwise, change node pointers until the new node is the new "border" between sections.
# Unfortunately this implementation seems slow in practice.

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} x
# @return {ListNode}
def partition(head, x)
    return unless head
    temp_head = ListNode.new(nil)
    temp_head.next = head
    lt_ptr = temp_head   # "less than" section pointer
    # lt_ptr = lt_ptr.next until (lt_ptr.nil? || lt_ptr.val < x)
    # return head if lt_ptr.nil?
    # head = lt_ptr
    lt_ptr = lt_ptr.next while (lt_ptr.next&.val < x)
    ptr = lt_ptr    # traversal pointer
    while ptr&.next
        if ptr.next.val < x
            new_node = ptr.next
            # Update traversal pointer
            ptr.next = ptr.next.next
            # Update "less than" section pointer
            new_node.next = lt_ptr.next
            lt_ptr.next = new_node
            lt_ptr = new_node
        else
            ptr = ptr.next
        end
    end
    temp_head.next
end
