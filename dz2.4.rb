# Напишите метод вычисления [последовательности Фибоначчи]
# Попробуйте реализовать алгоритм с помощью цикла и с помощью рекурсии. На следующем занятии мы сравним что работает быстрее.

#Исходя из вики, начинается последовательность или с 0,1 или с 1,1. В данной реализации 1 - нулевой элемент последовательности

def fibonachchi n
  index=0; f1=0; f2=1
  while index<n
    f2+=f1
    f1=f2-f1
    index+=1
  end
  f2
end

def fib_recursion n
  return 1 if (n==0 || n==1)
  fib_recursion(n-2)+fib_recursion(n-1)
end

puts fibonachchi 0
puts fibonachchi 1
puts fibonachchi 2
puts fibonachchi 3
puts fibonachchi 4
puts fibonachchi 5
puts fibonachchi 6
puts fibonachchi 7
puts fibonachchi 100
puts
puts 'А теперь вычисляем рекурсивно'
puts '_____________________________'
puts fib_recursion 0
puts fib_recursion 1
puts fib_recursion 2
puts fib_recursion 3
puts fib_recursion 4
puts fib_recursion 5
puts fib_recursion 6
puts fib_recursion 7
puts fib_recursion 20
