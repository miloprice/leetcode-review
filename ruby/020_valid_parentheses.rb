# @param {String} s
# @return {Boolean}
def is_valid(s)
    paren_stack = []
    left_parens = Set.new(['(', '{', '['])

    s.each_char do |char|
        if left_parens.include? char
            paren_stack << char
        elsif char == ')'
            paren_stack[-1] == '(' ? paren_stack.pop : (return false)
        elsif char == '}'
            paren_stack[-1] == '{' ? paren_stack.pop : (return false)
        elsif char == ']'
            paren_stack[-1] == '[' ? paren_stack.pop : (return false)
        end
    end

    paren_stack.empty?
end
