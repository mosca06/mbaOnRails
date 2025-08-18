module BlackjackDSL
  VALUES = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']
  SUITS  = ['♠','♥','♦','♣']


  def deal
    @deck ||= VALUES.product(SUITS).map { |v,s| { 'value' => v, 'suit' => s } }.shuffle
    @game.update!(player_hand: [draw, draw], dealer_hand: [draw, draw], status: 'ongoing', winner: nil, deck: @deck)
  end

  def hit
    return if @game.status != 'ongoing'
    load_deck
    @game.player_hand << draw
    check_winner!
    save_deck
    @game.save!
  end

  def stand
    return if @game.status != 'ongoing'
    load_deck
    dealer_play!
    check_winner!
    save_deck
    @game.save!
  end

 
  def winner_is
    @game.winner || "none yet"
  end

  private

  def check_winner!
    player = @game.player_total
    dealer = @game.dealer_total

    if player > 21
      @game.update!(status: 'dealer_won', winner: 'dealer')
    elsif dealer > 21
      @game.update!(status: 'player_won', winner: 'player')
    elsif dealer >= 17
      if player > dealer
        @game.update!(status: 'player_won', winner: 'player')
      elsif dealer > player
        @game.update!(status: 'dealer_won', winner: 'dealer')
      else
        @game.update!(status: 'tie', winner: 'tie')
      end
    end
  end

  def draw
    @deck.pop
  end

  def dealer_play!
    while @game.dealer_total < 17
      @game.dealer_hand << draw
    end
  end

  def load_deck
    @deck = @game.deck || VALUES.product(SUITS).map { |v,s| { 'value' => v, 'suit' => s } }.shuffle
  end

  def save_deck
    @game.deck = @deck
  end
end
