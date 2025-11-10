def roman_to_int(s)
  values = {
    'I' => 1, 'V' => 5, 'X' => 10,
    'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000
  }

  total = 0
  s.chars.each_with_index do |char, i|
    if i + 1 < s.length && values[char] < values[s[i + 1]]
      total -= values[char]
    else
      total += values[char]
    end
  end
  total
end