# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    max_length = 0
    idx_start = 0
    idx_end = 0
    char_pool = Set.new([])

    while idx_end < s.length
        new_char = s[idx_end]
        if char_pool.include? new_char
            until s[idx_start] == new_char
                char_pool.delete(s[idx_start])
                idx_start += 1
            end
            idx_start += 1
        else
            char_pool.add(new_char)
            max_length = [max_length, char_pool.size].max
        end
        idx_end +=1
    end

    max_length
end
