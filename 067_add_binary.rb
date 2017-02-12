# @param {String} a
# @param {String} b
# @return {String}
# Faster than 56.52% of submissions
def add_binary_with_builtins(a, b)
    (a.to_i(2) + b.to_i(2)).to_s(2)
end

# Faster than 39.13% of submissions
def add_binary(a, b)
    carryover = false
    result = "0" * [a.length, b.length].max
    r_ptr = result.length - 1
    a_ptr = a.length - 1
    b_ptr = b.length - 1
    until a_ptr < 0 && b_ptr < 0
        a_last = (a_ptr < 0 ? false : a[a_ptr] == '1')
        b_last = (b_ptr < 0 ? false : b[b_ptr] == '1')
        if a_last && b_last && carryover
            result[r_ptr] = '1'
        elsif (a_last && b_last) || (carryover && (a_last || b_last))
            carryover = true
        elsif a_last || b_last
            result[r_ptr] = '1'
        elsif carryover
            result[r_ptr] = '1'
            carryover = false
        end
        a_ptr -= 1
        b_ptr -= 1
        r_ptr -= 1
    end
    carryover ? result.prepend('1') : result
end
