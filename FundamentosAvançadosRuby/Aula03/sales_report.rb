class SalesReport 
  include Enumerable

  def initialize(sales)
    @sales = sales
  end

  def each(&block)
    return @sales.each(&block) if block_given?
    @sales.each { |sale|  puts "#{sale[:product]} - R$#{sale[:amount]}" }
  end

  def total_by_category
    @sales.each_with_object(Hash.new(0)) do |sale, totals|
      totals[sale[:category]] += sale[:amount]
    end
  end

  def top_sales(n)
    sort_by { |sale| -sale[:amount] }.first(n)
  end

  def grouped_by_category
    group_by { |sale| sale[:category] }
  end

  def above_average_sales
    avg = map { |sale| sale[:amount] }.sum / count.to_f
    select { |sale| sale[:amount] > avg }
  end
end

sales = [
  { product: "Notebook", category: "Eletrônicos", amount: 3000 },
  { product: "Celular", category: "Eletrônicos", amount: 1500 },
  { product: "Cadeira", category: "Móveis", amount: 500 },
  { product: "Mesa", category: "Móveis", amount: 1200 },
  { product: "Headphone", category: "Eletrônicos", amount: 300 },
  { product: "Armário", category: "Móveis", amount: 800 }
]
salesReport = SalesReport.new(sales)

puts "Total por categoria:"
puts salesReport.total_by_category

puts "\nTop 3 vendas:"
puts salesReport.top_sales(4)

puts "\nAgrupado por categoria:"
puts salesReport.grouped_by_category

puts "\nVendas acima da média:"
puts salesReport.above_average_sales