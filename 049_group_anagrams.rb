# @param {String[]} strs
# @return {String[][]}
# Faster than 60.00% of submissions
def group_anagrams(strs)
  anagram_hash = {}

  strs.each do |str|
    sort_str = str.split("").sort.join
    if anagram_hash[sort_str]
      anagram_hash[sort_str] << str
    else
      anagram_hash[sort_str] = [str]
    end
  end

  anagram_hash.values
end
