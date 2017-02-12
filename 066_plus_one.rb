# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
    ptr = digits.length - 1
    digits[ptr] += 1
    while digits[ptr] == 10 && ptr > 0
        digits[ptr] = 0
        digits[ptr - 1] += 1
        ptr -= 1
    end
    digits[0..0] = [1, 0] if digits[ptr] == 10
    digits
end
