require_relative 'workers/electrician'
require_relative 'workers/plumber'
require_relative 'workers/mechanic'

class Factory
  def solve_problem(type)
    puts "Problema detectado."

   
    if type == :electrical
      worker = Electrician.new
    elsif type == :plumbing
      worker = Plumber.new
    elsif type == :mechanical
      worker = Mechanic.new
    end

    puts "Chamando especialista..."
    worker.fix_problem

    puts "Problema resolvido."
  end
end


