def search_insert(nums, target)
  nums.each_with_index do |num, i|
    return i if num >= target
  end
  nums.length
end