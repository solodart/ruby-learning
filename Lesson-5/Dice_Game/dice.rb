class Dices
  def initialize sides_of_dice, number_of_dice
    @sides = sides_of_dice
    @numbers = number_of_dice
  end

  def throw
    #чувствую, реализуемо с inject без костылей с лишней переменной sum, но не удалось
    sum=0
    @numbers.times {sum+=rand(1..@sides)}
    sum
  end

end
