require_relative '../workers/electrician'
require_relative '../workers/plumber'
require_relative '../workers/mechanic'

class WorkerFactory
  WORKERS = {
    electrical: Electrician,
    plumbing: Plumber,
    mechanical: Mechanic
  }

  def self.create(type)
    worker_class = WORKERS.fetch(type) do
      raise ArgumentError, "Tipo de trabalhador desconhecido: #{type}"
    end

    worker_class.new
  end
end