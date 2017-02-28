# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
# Faster than 37.50% of submissions
def rotate_right(head, k)
    return unless head

    list_len = 0
    ptr = head
    old_head = head
    while ptr
        ptr = ptr.next
        list_len += 1
        old_tail = ptr if ptr && !ptr.next
    end
    k = k % list_len
    return head if k == 0

    new_head = head
    (list_len - k - 1).times do
        new_head = new_head.next
    end
    new_tail = new_head
    new_head = new_head.next

    old_tail.next = old_head
    new_tail.next = nil
    new_head
end
