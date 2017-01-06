#Напишите класс Rectangle для вычисления периметра и площади прямоугольника.
#Класс Rectangle должен реализовывать 2 метода: Rectangle#area и Rectangle#perimeter — для вычисления площади и периметра соответственно.
#Rectangle::new принимает 2 аргумента, каждый из которых — экземпляр класса Point. Таким образом, прямоугольник задаётся двумя вершинами (левая верхняя и правая нижняя).

class Rectangle

  def initialize start_point, end_point
    @start_point = start_point
    @end_point   = end_point
  end

  def area
    (@end_point.x - @start_point.x).abs * (@end_point.y - @start_point.y).abs
  end

  def perimeter
    (@end_point.x - @start_point.x).abs + (@end_point.y - @start_point.y).abs
  end

end

class Point
  attr_accessor :x, :y

  def initialize x: 0, y: 0
    @x = x
    @y = y
  end
end


ground = Rectangle.new(Point.new(x: 1, y: 1), Point.new(x: 10, y: 10))

p ground.area
p ground.perimeter
