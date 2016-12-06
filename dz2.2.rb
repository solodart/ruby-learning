# У вас есть массив имён, например:
#
# ```ruby
# names = %w[ambientsketchbook Erik\ Wollo Brian\ Eno Evangelos\ Papathanassiou Shulman]
# ```
#
# Пробегитесь по ним и выведите только те, **длина которых меньше 10 символов** и **первая буква заглавная**. При реализации условий постарайтесь каждое из них обернуть в отдельный метод.

names = %w[ambientsketchbook Ekik\ Wollo Brian\ Eno Evangelos\ Papathanassiou Shulman]

def length_condition? string
  string.length<10
end

def first_letter_capital? string
  string[0]==string[0].upcase
end

names.each {|name| puts name if length_condition?(name)&&first_letter_capital?(name)}
