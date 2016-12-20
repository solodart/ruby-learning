#Напишите метод combination для поиска сочетаний в массиве элементов.
#Сравните производительность метода с одноимённым методом Ruby из класса Array при помощи модуля Benchmark.
#В качестве дополнительной тренировки модифицируйте ваш метод таким образом, чтобы он принимал переменное количество аргументов:
#combination :one, :two, :three, :four, group_size: 2
require 'benchmark'

def combination array, n
  res=[]
  code=""
  i0=-1 #вроде magic number, но зато удобно, без исключений генерится код дальше
  l=array.length

  n.times {|i| code+="(i#{i}+1).upto(l-n+#{i}) do |i#{i+1}|\n"}
  code+="res.push ["
  n.times {|i| code+="array[i#{i+1}], "}
  code[-2..-1]="]\n"
  n.times{code+="end\n"}
  eval code
# Пример code для n=3
# (i0+1).upto(l-n+0) do |i1|
#   (i1+1).upto(l-n+1) do |i2|
#     (i2+1).upto(l-n+2) do |i3|
#       res.push [array[i1], array[i2], array[i3]]
#     end
#   end
# end

  res
end

def comb_with_var_arg *arg, group_size
  combination arg, group_size
end

m=%w(a b c d e f)
n=3

print 'Исходный массив: '
p m
puts "Формируем группы из #{n} элементов."
p combination m, n
puts "Снова, но передаём произвольное количество аргументов, вместо массива"
p comb_with_var_arg "a", "b", "c", "d", "e", "f", 3
puts "И ещё разок, но встроенным функционалом"
p m.combination(n).to_a
puts

puts '--- Benchmark ---'
Benchmark.bm(28) do |bm|
  bm.report ('---My--- method of combination') do
    10_000.times{combination m, n}
  end

  bm.report ('Existing method of combination') do
    10_000.times{m.combination(n).to_a}
  end
end
