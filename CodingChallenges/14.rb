def longest_common_prefix(strs)
  return "" if strs.empty?

  prefix = strs.first
  strs.each do |str|
    while !str.start_with?(prefix)
      prefix = prefix[0...-1]
      return "" if prefix.empty?
    end
  end
  prefix
end