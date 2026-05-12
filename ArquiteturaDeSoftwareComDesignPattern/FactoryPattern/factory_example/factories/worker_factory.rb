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
    WORKERS[type].new
  end
end