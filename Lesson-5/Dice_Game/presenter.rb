LANGUAGE = {
  welcome: 'The DiceGame has started!',
  turn: 'Wheel of fortune throws: ',
  win: ' won! He earns ',
  loss: ' lost. He loses ',
  credits: ' credits',
  finish: 'The Game is finished! Results:'
}

def text_welcome
  LANGUAGE[:welcome]
end

def text_throw_done throw_result
  "#{LANGUAGE[:turn]}#{throw_result}"
end

def text_loss_result player
  "#{player.name}#{LANGUAGE[:loss]}#{player.bet_credits}#{LANGUAGE[:credits]}"
end

def text_win_resul player, turn_result
  "#{player.name}#{LANGUAGE[:win]}#{turn_result}#{LANGUAGE[:credits]}"
end

def game_is_finished
  LANGUAGE[:finish]
end

def text_finish player
  if player.game_result > 0 then
    "#{player.name}#{LANGUAGE[:win]}#{player.game_result}#{LANGUAGE[:credits]}"
  else
    "#{player.name}#{LANGUAGE[:loss]}#{player.game_result}#{LANGUAGE[:credits]}"
  end
end

def puts_error error
  puts "--------------------------- Error!!! Can't turn!"
  puts error
  'Error'
end

def text_score_error player
  "Player #{player.name}: score incorrect (#{player.score}). "
end

def text_bet_credits_error player
  "Player #{player.name}: bet_credits incorrect (#{player.bet_credits}, player have #{player.credits} credits)"
end
