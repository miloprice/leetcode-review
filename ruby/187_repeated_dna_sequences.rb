# Brute force solution: for each 10-letter substring, search the whole string for that substring.
# Better solution: use a set/hash table; if each 10-letter substring is already in the set, add it to output; otherwise, add it to the set
# Tricky solution: use the fact that there are only 4 allowable values to our advantage. Convert the string to a binary number, where A maps to 00, C to 01, G to 10, and T to 11 (this also means that each molecule's mapping is the inverse of its complement molecule). Use these numbers as keys for the hash table, allowing O(1) comparisons/lookups. In practice, this doesn't actually seem to be fast enough, however.

# Faster than 50.00% of submissions
# @param {String} s
# @return {String[]}
def find_repeated_dna_sequences(s)
  low_idx = 0
  high_idx = 10
  hsh = {}
  result = {}

  while high_idx <= s.length
    slice = s[low_idx...high_idx]
    if hsh[slice]
      result[slice] = true
    else
      hsh[slice] = true
    end
    low_idx += 1
    high_idx += 1
  end

  return result.keys
end


def find_repeated_dna_sequences_bitwise(s)
  dna_num = 0
  multiplier = 1
  s.each_char do |char|
    case char
    when 'C'
      dna_num += 1 * multiplier
    when 'G'
      dna_num += 2 * multiplier
    when 'T'
      dna_num += 3 * multiplier
    end
    multiplier *= 4
  end

  strings_encountered = {}
  result = {}

  mask = 2 ** 20 - 1
  (s.length - 9).times do
    section = dna_num & mask
    strings_encountered[section] ? result[section] = true : strings_encountered[section] = true

    dna_num >>= 2
  end

  result.map do |string_num, _|
    value = ""
    10.times do
      last_char = string_num & 3
      case last_char
      when 0
        value += 'A'
      when 1
        value += 'C'
      when 2
        value += 'G'
      when 3
        value += 'T'
      end
      string_num >>= 2
    end
    value
  end
end
