# Представьте, что у вас есть объект класса `Hash`:
#
# ```ruby
# player = { name: 'johnny', color: :red }
# ```
#
# и переменная `colors`:
#
# ```ruby
# colors = [:blue, :white, :green, :red, :orange]
# ```
#
# Напишите код, который будет выбирать случайный цвет из массива `colors` и сравнивать его с цветом в хэше `player`.
#
# **Если цвета совпадают** — выводите сообщение «Джонни, ты прав!». **Если цвета не совпадают, но количество символов из которых они состоят одинаково** — выводите: «Джонни, букв столько же, но значение иное!». **В остальных случаях** — выводите любое другое сообщение.
#
# Постарайтесь сделать так, чтобы сообщения в выводе не включали явно заданное имя, а брали его из хэша с помощью интерполяции.
#
# Оберните код в метод, можно в несколько.


def random_of_array array
  array[rand(array.length)]
end

# arg of match_of_colors: player - Hash {:name, :color}, color - symbol
def match_of_colors player, color
  if color==player[:color]
    "#{player[:name]}, ты прав! Это действительно #{color}!"
  elsif color.length==player[:color].length
    "#{player[:name]}, букв столько же, но значение иное!"
  else
    "Увы, #{player[:name]}, ты далёк от истины."
  end
end

#Вопрос! При совпадения имени у Хеша в коде с именем аргумента у метода конфликта не возникает. Внутри метода нет доступа к переменным, если они не переданы в аргументе?
#считается ли такое совпадение плохим тоном?
player = {name: 'Johnny', color: :white}
player2 ={name: 'Billy', color: :green}
colors = [:blue, :white, :green, :red, :orange]

puts match_of_colors player, (random_of_array colors)
puts match_of_colors player2, (random_of_array colors)
