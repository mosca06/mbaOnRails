def single_number(nums)
  result = 0
  nums.each { |num| result ^= num }
  result
end