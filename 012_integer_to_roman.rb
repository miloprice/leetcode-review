VALUES = {
  1  => 'I',
  5  => 'V',
  10   => 'X',
  50   => 'L',
  100  => 'C',
  500  => 'D',
  1000 => 'M'
}.freeze

# @param {Integer} num
# @return {String}
def int_to_roman(num)
  result = ''
  radix = 1

  while num > 0
    place = num % 10
    if (place_val = VALUES[radix * place])
      result.prepend place_val
    elsif place > 0 && (plus_one_val = VALUES[(place + 1) * radix])
      result.prepend VALUES[radix] + plus_one_val
    elsif place > 5 && (place_five = VALUES[radix * 5])
      result.prepend place_five + (VALUES[radix] * (place - 5))
    else
      result.prepend VALUES[radix] * place
    end
    radix *= 10
    num /= 10
  end

  result
end

p int_to_roman(0) == ''
p int_to_roman(1) == 'I'
p int_to_roman(10) == 'X'
p int_to_roman(20) == 'XX'
p int_to_roman(55) == "LV"
p int_to_roman(99) == 'XCIX'
p int_to_roman(6789) == 'MMMMMMDCCLXXXIX'