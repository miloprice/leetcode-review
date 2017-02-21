# Faster than 100.0% of submissions (!)
class Trie

=begin
  Initialize your data structure here.
=end
  def initialize()
    @trie = {}
  end

=begin
  Inserts a word into the trie.
  :type word: String
  :rtype: Void
=end
  def insert(word)
    ptr = @trie
    word.each_char do |char|
      ptr[char] ? ptr = ptr[char] : ptr = (ptr[char] = {})
    end
    ptr[nil] = true
  end

=begin
  Returns if the word is in the trie.
  :type word: String
  :rtype: Boolean
=end
  def search(word)
    ptr = @trie
    word.each_char do |char|
      ptr[char] ? ptr = ptr[char] : (return false)
    end
    ptr.include? nil
  end

=begin
  Returns if there is any word in the trie that starts with the given prefix.
  :type prefix: String
  :rtype: Boolean
=end
  def starts_with(prefix)
    ptr = @trie
    prefix.each_char do |char|
      ptr[char] ? ptr = ptr[char] : (return false)
    end
    true
  end
end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)
