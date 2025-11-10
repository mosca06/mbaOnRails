def climb_stairs(n)
  return n if n <= 2

  a, b = 1, 2
  (3..n).each do
    a, b = b, a + b
  end
  b
end