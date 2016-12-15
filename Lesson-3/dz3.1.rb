#Напишите метод combination для поиска сочетаний в массиве элементов. Сравните производительность метода с одноимённым методом Ruby из класса Array при помощи модуля Benchmark.

def combination array, n
  res=[];
  l=array.length
  code=""; i0=-1
  n.times {|i| code+="(i#{i}+1).upto(l-n+#{i}) do |i#{i+1}|\n"}
  code+="res.push ["
  n.times {|i| code+="array[i#{i+1}], "}
  code[-2]="]"; code [-1]="\n" # исправить, в этом месте точно можно сделать лучше
  n.times{code+="end\n"}
  eval code
  res
end

m=%w(a b c d)
n=2

p combination m, n
