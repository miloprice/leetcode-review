# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    l1_ptr = l1
    l2_ptr = l2
    first_add = l1_ptr.val + l2_ptr.val
    if first_add >= 10
        carryover = 1
        first_add = first_add - 10
    else
        carryover = 0
    end
    result = ListNode.new(first_add)
    res_ptr = result
    l1_ptr = l1_ptr.next
    l2_ptr = l2_ptr.next

    while l1_ptr && l2_ptr
        add_val = l1_ptr.val + l2_ptr.val + carryover
        carryover = add_val >= 10 ? 1 : 0
        add_val = add_val >= 10 ? add_val - 10 : add_val
        res_ptr.next = ListNode.new(add_val)
        res_ptr = res_ptr.next
        l1_ptr = l1_ptr.next
        l2_ptr = l2_ptr.next
    end

    if l_ptr = (l1_ptr || l2_ptr)
        while l_ptr
            add_val = l_ptr.val + carryover
            if add_val >= 10
                add_val = add_val - 10
                carryover = 1
            else
                carryover = 0
            end
            res_ptr.next = ListNode.new(add_val)
            res_ptr = res_ptr.next
            l_ptr = l_ptr.next
        end
    end

    res_ptr.next = ListNode.new(1) if carryover > 0

    result
end
