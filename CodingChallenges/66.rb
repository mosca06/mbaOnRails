def plus_one(digits)
  carry = 1
  (digits.length - 1).downto(0) do |i|
    sum = digits[i] + carry
    digits[i] = sum % 10
    carry = sum / 10
  end
  digits.unshift(1) if carry == 1
  digits
end