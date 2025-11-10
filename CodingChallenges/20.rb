def is_valid(s)
  pairs = { ')' => '(', ']' => '[', '}' => '{' }
  stack = []

  s.each_char do |char|
    if pairs.values.include?(char)
      stack << char
    elsif pairs[char]
      return false if stack.empty? || stack.pop != pairs[char]
    end
  end

  stack.empty?
end