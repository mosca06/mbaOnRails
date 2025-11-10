def remove_element(nums, val)
  index = 0
  nums.each do |num|
    if num != val
      nums[index] = num
      index += 1
    end
  end
  index
end