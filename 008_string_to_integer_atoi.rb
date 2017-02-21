# @param {String} str
# @return {Integer}
# Faster than 54.55% of submissions
def my_atoi(str)
    str = str[1..-1] while str[0] == ' '
    str = str.match(/^[+-]?[0-9]+/).to_s
    negative = str[0] == '-'
    total = 0
    idx = 1

    while (num_char = str[-idx] && num = num_char.ord - 48)
        num = num_char.ord - 48
        total += num * 10 ** (idx - 1) if num >= 0 && num <= 9
        idx += 1
    end

    p "total: #{total}"
    if total > 2147483647 && !negative
        2147483647
    elsif total > 2147483648 && negative
        -2147483648
    elsif negative
        -total
    else
        total
    end
end
