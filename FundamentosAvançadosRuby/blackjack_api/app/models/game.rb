class Game < ApplicationRecord
  has_many :moves, dependent: :destroy
  validates :status, inclusion: { in: %w[ongoing player_won dealer_won tie] }

  def player_total
    total(player_hand)
  end

  def dealer_total
    total(dealer_hand)
  end

  private

  def total(hand)
    sum = 0
    aces = 0
    hand.each do |card|
      value = card['value']
      if value == 'A'
        sum += 11
        aces += 1
      elsif ['J','Q','K'].include?(value)
        sum += 10
      else
        sum += value.to_i
      end
    end
   
    aces.times { sum -= 10 if sum > 21 }
    sum
  end
end