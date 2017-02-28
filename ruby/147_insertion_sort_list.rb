# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
# Faster than 66.67% of submissions
def insertion_sort_list(head)
    return unless head
    temp_head = ListNode.new(nil)
    temp_head.next = head

    sort_ptr = temp_head
    ptr = temp_head
    while ptr.next
        new_node = ptr.next
        if ptr.val && new_node.val < ptr.val
            # new node should go to sorted section; ptr always starts at the end of sorted section
            ptr.next = new_node.next
            new_node.next = temp_head.next
            temp_head.next = new_node
            node_chaser = temp_head
            while new_node.next && new_node.val > new_node.next.val
                node_chaser.next = new_node.next
                new_node.next = new_node.next.next
                node_chaser.next.next = new_node
                node_chaser = node_chaser.next
            end
        else
            ptr = ptr.next
        end
    end
    temp_head.next
end
