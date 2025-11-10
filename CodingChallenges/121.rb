def max_profit(prices)
  min_price = prices[0]
  max_profit = 0

  prices.each do |price|
    min_price = [min_price, price].min
    max_profit = [max_profit, price - min_price].max
  end

  max_profit
end