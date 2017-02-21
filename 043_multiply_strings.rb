# @param {String} num1
# @param {String} num2
# @return {String}
# Faster than 81.25% of solutions (is this within the rules?)
def multiply(num1, num2)
  idx = -1
  num1_val = 0
  num2_val = 0
  while num1[idx] || num2[idx]
    if num1_at_idx = num1[idx]
      num1_val += (num1_at_idx.ord - 48) * (10 ** (-idx - 1))
    end
    if num2_at_idx = num2[idx]
      num2_val += (num2_at_idx.ord - 48) * (10 ** (-idx - 1))
    end
    idx -= 1
  end
  (num1_val * num2_val).to_s
end
