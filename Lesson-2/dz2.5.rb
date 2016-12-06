# Напишите алгоритм [rot13](https://ru.wikipedia.org/wiki/ROT13), позволяющий кодировать и декодировать текст на английском языке. Например:
#
# ```ruby
# cypher = 'Lbh unpxrq n irel frperg zrffntr!'
# rot13(cypher) # => ?
# ```

#не красиво, что одинаковая строка объявляется в обоих методах. как объявить её так, чтоб была доступна отовсюду? да и в целом, кажется, что может быть симпатичнее код

def find_position letter
  abc = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
  index=0
  abc.each_char { |l|
    return index if letter==abc[index]
    index+=1
  }
  100
end

def rot13! cypher
  abc = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
  index=0
  cypher.each_char { |l|
    p=find_position(cypher[index])
    cypher[index]=abc[(p+13)%52] unless p==100
    index+=1
  }
end

cypher = 'Lbh unpxrq n irel frperg zrffntr!'

rot13! cypher
puts cypher
rot13! cypher
puts cypher
rot13! cypher
puts cypher
