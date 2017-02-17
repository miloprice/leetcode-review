# @param {String} s
# @return {Boolean}
# Faster than 94.44% of submissions(?)
def is_palindrome(s)
    cleaned_string = s.downcase.gsub(/[^a-z0-9]/, '')
    if cleaned_string.length == 0 || cleaned_string.length == 1
        true
    elsif cleaned_string.length % 2 == 0
        cleaned_string[0...cleaned_string.length / 2] == cleaned_string[cleaned_string.length / 2..-1].reverse
    else
        cleaned_string[0...cleaned_string.length / 2].to_s == cleaned_string[(cleaned_string.length / 2) + 1..-1].to_s.reverse
    end
end
