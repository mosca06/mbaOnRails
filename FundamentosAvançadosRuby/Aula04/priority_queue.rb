class PriorityQueue 
  def initialize
    @queues = {
      high: Queue.new,
      medium: Queue.new,
      low: Queue.new
    }
  end


  def schedule(priority = :medium, &block)
    @queues[priority] << block
  end

  def pop
    %i[high medium low].each do |priority|
      return @queues[priority].pop unless @queues[priority].empty?
    end
    puts "Queues empty"
    nil
  end
end