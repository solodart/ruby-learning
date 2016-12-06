# Напишите программу которая выводит матрицу на экран. Матрица задаётся в виде хэша:
# matrix = {
#   data: [1, 2, 3, 4, 5, 6],
#   rows: 2,
#   cols: 3
# }
# Запрещается использовать другие структуры данных, а также встроенные методы кроме циклов и итераций.
#
# Требуемый результат:
# [
#   1 2 3
#   4 5 6
# ]

def print_matrix matrix
  matrix[:data].each_with_index {|i|
  print "#{matrix[:data][i-1]} "
  puts if (i%matrix[:cols]==0)
  }
end

matrix = {
  data: [1, 2, 3, 4, 5, 6],
  rows: 2,
  cols: 3
}
matrix2 = {
  data: (1..100).to_a,
  cols: 10
}

print_matrix matrix
puts '_________________'
print_matrix matrix2
