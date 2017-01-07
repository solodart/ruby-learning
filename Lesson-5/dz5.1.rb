# Напишите модуль CalculateYears для определения возраста (полных лет). Затем подключите его в классы User и Winery.
# Благодаря этому мы сможем узнать возраст пользователя или количество лет существования винодельни.

module CalculateYears
  require 'Date'
  def years_old
    ((Date.today - Date.parse(@date))/365).to_i
  end
end

class User
  include CalculateYears
  def initialize name, date_of_birth
    @date = date_of_birth
  end
end

class Winery
  include CalculateYears
  def initialize title, date_of_foundation
    @date = date_of_foundation
  end
end

p User.new('Julie', '1996-07-22').years_old # => 19
p Winery.new('A Light Drop', '1954-08-01').years_old # => 61
