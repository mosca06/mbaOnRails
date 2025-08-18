class Move < ApplicationRecord
  belongs_to :game
  validates :move_type, inclusion: { in: %w[hit stand] }
end