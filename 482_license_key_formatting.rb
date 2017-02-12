# @param {String} s
# @param {Integer} k
# @return {String}
def license_key_formatting(s, k)
    s.gsub!('-', '')
    s.upcase!
    first_seg_len = s.length % k
    idx = (first_seg_len == 0 ? k : first_seg_len)
    while idx < s.length
        s.insert(idx, '-')
        idx += k + 1
    end
    s
end
