class GamesController < ApplicationController
  before_action :set_game, only: [:show, :move]

  def create
    game = Game.create!
    BlackjackService.play(game) do
      deal  
      each { |card| puts "Carta do jogador: #{card}" }
    end
    render json: game_response(game)
  end

  def show
    render json: game_response(@game)
  end

  def move
    move_type = params.require(:move_type)

    BlackjackService.play(@game) do
      case move_type
      when 'hit'   then hit
      when 'stand' then stand
      else raise 'move_type inválido'
      end
    end

    Thread.new do
      @game.moves.create!(move_type: move_type)
    end
    
    render json: game_response(@game)
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_response(game)
    {
      id: game.id,
      player_hand: game.player_hand,
      dealer_hand: game.dealer_hand,
      status: game.status,
      winner: game.winner,
    }
  end
end
