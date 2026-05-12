require_relative 'worker_factory'

class Factory
  def solve_problem(type)
    puts "Problema detectado."

    worker = WorkerFactory.create(type)

    puts "Chamando especialista..."
    worker.fix_problem

    puts "Problema resolvido."
  end
end