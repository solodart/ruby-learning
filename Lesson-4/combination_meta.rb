#Напишите метод combination для поиска сочетаний в массиве элементов.
#Сравните производительность метода с одноимённым методом Ruby из класса Array при помощи модуля Benchmark.
#В качестве дополнительной тренировки модифицируйте ваш метод таким образом, чтобы он принимал переменное количество аргументов:
#combination :one, :two, :three, :four, group_size: 2
require 'benchmark'

def add_upto_to_meta n
  code =""
  n.times {|i| code+="(i#{i}+1).upto(upto_upper_bound+#{i}) do |i#{i+1}|\n"}
  code[1..4]='0'
  code
end

def add_push_to_meta n
  code ="res.push ["
  n.times {|i| code+="array[i#{i+1}], "}
  code[-2..-1]="]\n"
  code
end

def combination array, n
  res = []
  upto_upper_bound = array.length - n

  meta_code = add_upto_to_meta n
  meta_code+= add_push_to_meta n
  n.times{meta_code+="end\n"} ### add_end_to_meta without personal def

  eval meta_code
  res
end

def comb_with_var_arg *arg, group_size
  combination arg, group_size
end

###################


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
