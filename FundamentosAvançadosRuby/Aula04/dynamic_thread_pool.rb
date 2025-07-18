class DynamicThreadPool
  def initialize(max_threads: 3)
    @task_queue = PriorityQueue.new
    @threads = max_threads.times.map { new_thread }
  end

  def new_thread
    Thread.new do
      loop do
        task = @task_queue.pop
        task.call if task
      end
    end
  end

  def schedule(priority = :medium, &block)
    @task_queue.schedule(priority, &block)
  end

  def shutdown
    sleep 1 while !queues_empty?
    @threads.each(&:exit)
    @threads.each(&:join)
  end

  private

  def queues_empty?
    @task_queue.empty?
  end
end
