def generate(num_rows)
  triangle = [[1]]
  (1...num_rows).each do |i|
    prev = triangle.last
    row = [1]
    (1...i).each do |j|
      row << prev[j - 1] + prev[j]
    end
    row << 1
    triangle << row
  end
  triangle
end