def get_row(row_index)
  row = [1]
  (1..row_index).each do |i|
    new_row = [1]
    (1...i).each do |j|
      new_row << row[j - 1] + row[j]
    end
    new_row << 1
    row = new_row
  end
  row
end
