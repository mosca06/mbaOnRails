require_relative 'worker'

class Mechanic < Worker
  def fix_problem
    puts "Consertando a parte mecânica."
  end
end