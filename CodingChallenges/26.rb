def remove_duplicates(nums)
  return 0 if nums.empty?

  index = 1
  (1...nums.length).each do |i|
    if nums[i] != nums[i - 1]
      nums[index] = nums[i]
      index += 1
    end
  end
  index
end