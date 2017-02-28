# @param {Integer} n
# @return {String}
# Faster than 53.33% of submissions
def count_and_say(n)
    if n == 1
        '1'
    elsif n > 1
        prev_val = count_and_say(n - 1)
        cur_char = nil
        cur_count = 0
        cur_val = ""
        prev_val.each_char.each do |new_char|
            if cur_char && new_char != cur_char
                cur_val << cur_count.to_s + cur_char
                cur_char = new_char
                cur_count = 0
            elsif cur_char.nil?
                cur_char = new_char
            end
            cur_count += 1
        end
        cur_val << cur_count.to_s + cur_char

        cur_val
    end
end
