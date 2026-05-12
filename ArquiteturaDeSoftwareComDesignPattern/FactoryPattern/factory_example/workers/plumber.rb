require_relative 'worker'

class Plumber < Worker
  def fix_problem
    puts "Consertando o encanamento."
  end
end