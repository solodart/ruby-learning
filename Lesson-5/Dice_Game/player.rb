class Player
  attr_accessor :credits, :game_result
  attr_reader :name, :score, :bet_credits

  def initialize name, credits
    @credits = credits
    @name = name
    @bet_credits = 0
    @score = 0
  end

  def bet score, bet_credits
    @score = score
    @bet_credits = bet_credits
  end


end
