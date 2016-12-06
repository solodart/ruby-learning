# Посчитайте количество символов в каждом элементе массива:
#
# ```ruby
# [“Ruby”, “Python”, “JavaScript”, “Java”, “.NET”, “HTML”, “Clojure”]
# ```
#
# Подсказка:
#
# Используйте метод `inject`
#
# Результат выведите на экран в виде хэша:
#
# ```ruby
# {"Ruby"=>4, "Python"=>6, "JavaScript"=>10, "Java"=>4, ".NET"=>4, "HTML"=>4, "Clojure"=>7, "Go"=>2}
# ```

#Увы, не понял, как в данной задаче красиво применить inject :(
lang =%w[Ruby Python JavaScript Java .NET HTML Clojure Go]
result_hash={}
lang.each{|element| result_hash[element]=element.length}

puts result_hash

#использую inject хоть как-нибудь
length_array = result_hash.values
puts "Суммарное количество символов в массиве = #{length_array.inject :+}."
