  require_relative 'dice'
  require_relative 'player'
  require_relative 'presenter'
  require_relative 'validations'

  NUMBER_OF_DICE  = 2
  SIDES_OF_DICE   = 6
  PERCENT_OF_GANE = 250

  class DiceGame
    include Validations

    def initialize *players
      @dices = Dices.new(SIDES_OF_DICE, NUMBER_OF_DICE)
      @players = players
      players.each {|player| player.game_result=0}
      puts text_welcome
    end

    def turn
      return unless validate(@players) == nil

      throw_result = @dices.throw
      puts '---------------------------'
      puts text_throw_done(throw_result)

      @players.each do |player|
        if throw_result == player.score then
          turn_result = player.bet_credits*PERCENT_OF_GANE/100
          player.credits += turn_result
          player.game_result += turn_result
          puts text_win_resul(player, turn_result)
        elsif
          player.credits -= player.bet_credits
          puts text_loss_result(player)
          player.game_result -=player.bet_credits
        end
        player.bet(0, 0)
      end
    end

    def finish
      puts '******************************'
      puts game_is_finished
      @players.each do |player|
        puts text_finish(player)
      end
    end

  end
