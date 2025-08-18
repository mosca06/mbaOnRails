require_relative 'blackjack_dsl'

class BlackjackService
  include BlackjackDSL
  include Enumerable
  
  def initialize(game)
    @game = game
    deal if @game.player_hand.empty?
  end

  def each
    @game.player_hand.each { |card| yield card }
  end
  
  def self.play(game, &block)
    new(game).instance_eval(&block)
  end
end
