def val(c)
    val = {
        "M" => 1000,
        "D" => 500,
        "C" => 100,
        "L" => 50,
        "X" => 10,
        "V" => 5,
        "I" => 1
    }
    val[c]
end

# @param {String} s
# @return {Integer}
def roman_to_int_logical(s)
    total = 0
    last_val = nil
    diff = 0
    s.split("").each do |c|
        c_val = val(c)
        # Get "values" by collecting substrings until you get to a token of higher or lower value
        # modifier = 0
        # No subtraction required
        if last_val && c_val < last_val
            total += diff
            diff = 0
        # Subtraction required
        elsif last_val && c_val > last_val
            total -= diff
            diff = 0
        end
        diff += c_val
        last_val = c_val
    end
    total += diff
end

# Faster, but less concise, logic
def roman_to_int(s, total=0)
    if s.size == 0
        total
    elsif s[0] == "M"
        roman_to_int(s[1..-1], 1000 + total)
    elsif s[0..1] == "CM"
        roman_to_int(s[2..-1], 900 + total)
    elsif s[0] == "D"
        roman_to_int(s[1..-1], 500 + total)
    elsif s[0..1] == "CD"
        roman_to_int(s[2..-1], 400 + total)
    elsif s[0] == "C"
        roman_to_int(s[1..-1], total + 100)
    elsif s[0..1] == "XC"
        roman_to_int(s[2..-1], total + 90)
    elsif s[0] == "L"
        roman_to_int(s[1..-1], total + 50)
    elsif s[0..1] == "XL"
        roman_to_int(s[2..-1], total + 40)
    elsif s[0] == "X"
        roman_to_int(s[1..-1], total + 10)
    elsif s[0..1] == "IX"
        roman_to_int(s[2..-1], total + 9)
    elsif s[0] == "V"
        roman_to_int(s[1..-1], total + 5)
    elsif s[0..1] == "IV"
        roman_to_int(s[2..-1], total + 4)
    elsif s[0] == "I"
        roman_to_int(s[1..-1], total + 1)
    else
        raise ArgumentError
    end
end
