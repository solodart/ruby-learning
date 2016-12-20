# Дополнительное поведение класса Point
# Добавьте метод similar_quarter? для проверки того, лежат ли обе точки в одной четверти координатной плоскости. Метод должен возвращать true или false
# Метод проверяющий лежит ли точка в начале координат
# Метод, устанавливающий точку в начало координат
# Метод + для сложения двух объектов класса Point

# Методы сравнения для класса Point
# Подмешайте в класс Point модуль Comparable для получения методов сравнения. Сравнивать объекты класса Point на основе их расстояния от начала координат
# Метод <=> должен возвращать -1, если первая точка ближе к началу координат, чем вторая, 1 – если она дальше и 0 – если расстояние от начала координат до каждой из точек одинаково.
# Метод <=> также должен возвращать nil, если аргумент не является объектом класса Point.

class Point

  include Comparable

  attr_accessor :x, :y

  def initialize x = 0, y = 0
    @x = x
    @y = y
  end

  def similar_quarter? point2
    (@x * point2.x) > 0 && (@y * point2.y) > 0 ? true : false
  end

  def origin?
    @x==0 && @y==0 ? true : false
  end

  def + point2
    Point.new(x = (@x+point2.x), y = (@y+point2.y))
  end

  def distance_to_origin
    (@x**2+@y**2)**0.5
  end

  def <=> point2
    return nil unless point2.is_a? Point
    #не работает. Например, в случае p1 > 'a' - выкидывает с ошибкой, вместо ожидаемого nil "comparison of Point with String failed (ArgumentError)"

    if self.distance_to_origin > point2.distance_to_origin
      1
    elsif self.distance_to_origin < point2.distance_to_origin
      -1
    else
      0
    end
  end

  def to_s
    "x=#{@x}, y=#{@y}"
  end

end

#################################

p1 = Point.new(100, 25)
p2 = Point.new(-25, 100)
p3 = Point.new(x = -76, y = 18 )
p4 = Point.new(0, 0)

puts "Для тестирования класса Point созданы 4 точки:"
puts "p1: #{p1}, p2: #{p2}, p3: #{p3} и p4: #{p4}"

puts "Точки p1 и p2 в одной плоскасти? #{p1.similar_quarter?(p2)}"
puts "Точки p2 и p3 в одной плоскасти? #{p2.similar_quarter?(p3)}"
puts "В начале ли координат p4? #{p4.origin?}"
puts "А p2? #{p2.origin?}"
puts
puts "p1 + p2 = new_point #{p1 + p2}"
puts "Проверяем, p1<p3? #{p1<p3}"
puts "Равны ли p2 и p1? #{p2==p1}"
