module Validations
  require_relative 'presenter'

class PlayerBetError < StandardError
end

  def validate (players)
    result_of_validation=''
    players.each do |player|
      result_of_validation += text_score_error(player) unless player.score.between?(NUMBER_OF_DICE, SIDES_OF_DICE*NUMBER_OF_DICE)
      result_of_validation += text_bet_credits_error(player) unless player.bet_credits.between?(0,player.credits)
    end
  raise PlayerBetError, result_of_validation unless result_of_validation == ''
  rescue PlayerBetError => error
  puts_error(error)
  end
end
