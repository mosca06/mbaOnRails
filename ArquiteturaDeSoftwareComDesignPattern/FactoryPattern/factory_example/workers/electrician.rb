require_relative 'worker'

class Electrician < Worker
  def fix_problem
    puts "Consertando a parte elétrica."
  end
end