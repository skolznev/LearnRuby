puts "Глава 9. Более Сложные Структуры Данных"

require 'set'

s1 = Set[3,4,5]
arr1 = [3,4,5]
p Set.new(arr1)
p Set.new(arr1) {|x| x.to_s}

puts
puts "9.1.1. Простые Операции Над Множествами"

s2 = Set[1,2,3]
s3 = Set[3,4,5]
p s2.union(s3)
p s2 | s3
p s2 + s3
p s2.intersection(s3)
p s2 & s3
p s2 - s3
p s2.include?(2)
p s2.include?(4)
p s2.member?(4)

s4 = Set[1,2,3,4,5,6]
p s4.empty?
s4.clear
p s4.empty?

puts
puts "9.1.2. Более Сложные Операции Над Множествами"

s5 = Set[1,2,3,4,5]
s5.each {|x| puts x; break}

files = Set.new(Dir["*"])
hash = files.classify do |f|
  if File.size(f) <= 10_000
    :small
  elsif File.size(f) <= 10_000_000
    :medium
  else
    :large
  end
end

big_files = hash[:large]

s6 = Set[1,2,3,4,5,6,7,8,9,0]
p s6.divide{|i| i % 2}

s7 = Set[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31]
p s7.divide {|i,j| (i-j).abs == 2}

puts
puts "9.2. Стеки И Очереди"

puts
puts "9.2.1. Более Строгая Реализация Стека"

class Stack

  def initialize
    @store = []
  end

  def push(x)
    @store.push x
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def empty?
    @store.empty?
  end

end

puts
puts "9.2.2. Обнаружение Несбалансированных Скобок"

def paren_match(str)
  stack = Stack.new
  lsym = "{[(<"
  rsym = "}])>"
  str.each_byte do |byte|
    sym = byte.chr
    if lsym.include? sym
      stack.push(sym)
    elsif rsym.include? sym
      top = stack.peek
      if lsym.index(top) != rsym.index(sym)
        return false
      else
        stack.pop
      end
    end
  end
  return stack.empty?
end

str1 = "(((a+b))*((c-d)-(e*f))"
str2 = "[[(a-(b-c))], [[x,y]]]"
p paren_match str1
p paren_match str2

puts
puts "9.2.3. Стек И Рекурсия"

def towers(list)
  while !list.empty?
    n, src, dst, aux = list.pop
    if n == 1
      puts "Перемещаем диск с #{src} на #{dst}"
    else
      list.push [n-1,aux,dst,src]
      list.push [1,src,dst,aux]
      list.push [n-1,src,aux,dst]
    end
  end
end

list = []
list.push([3,"a","c","b"])

towers(list)

puts

def towers(n, src, dst, aux)
  if n == 1
    puts "Перемещаем диск с #{src} на #{dst}"
  else 
    towers(n-1, src, aux, dst)
     towers(1, src, dst, aux)
     towers(n-1, aux, dst, src)
  end
end

towers(3, "а", "с", "b")

puts
puts "9.2.4. Более Строгая Реализация Очереди"

class Queue

  def initialize
    @store = []
  end

  def enqueue(x)
    @store << x
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def lenght
    @store.lenght
  end

  def empty?
    @store.empty?
  end
end

puts
puts "9.3. Деревья"

puts
puts "9.3.1. Реализация Двоичного Дерева"

class Tree
  attr_accessor :left
  attr_accessor :right
  attr_accessor :data

  def initialize(x=nil)
    @left = nil
    @right = nil
    @data = x
  end

  def insert(x)
    list = []
    if @data == nil
      @data = x
    elsif @left == nil
      @left = Tree.new(x)
    elsif @right == nil
      @right = Tree.new(x)
    else
      list << @left
      list << @right
      loop do
        node = list.shift
        if node.left == nil
          node.insert(x)
          break
        else
          list << node.left
        end
        if node.right == nil
          node.insert(x)
          break
        else
          list << node.right
        end
      end
    end
  end

  def traverse()
    list = []
    yield @data
    list << @left if @left != nil
    list << @right if @right != nil
    loop do
      break if list.empty?
      node = list.shift
      yield node.data
      list << node.left if node.left != nil
      list << node.right if node.right != nil
    end
  end

end

items = [1, 2, 3, 4, 5, 6, 7]
tree = Tree.new
items.each {|x| tree.insert(x)}
tree.traverse {|x| print "#{x}"}
print "\n"

puts
puts "9.3.2. Сортировка С Помощью Двоичного Дерева"

class Tree
  attr_accessor :left
  attr_accessor :right
  attr_accessor :data

  def initialize(x=nil)
    @left = nil
    @right = nil
    @data = x
  end

  def insert(x)
    if @data == nil
      @data = x
    elsif x <= @data
      if @left == nil
        @left = Tree.new x
      else
        @left.insert x
      end
    else
      if @right == nil
        @right = Tree.new x
      else
        @right.insert x
      end
    end
  end

  def inorder()
    @left.inorder {|y| yield y} if @left != nil
    yield @data
    @right.inorder {|y| yield y} if @right != nil
  end

  def preorder()
    yield @data
    @left.preorder {|y| yield y} if @left != nil
    @right.preorder {|y| yield y} if @right != nil
  end

  def postorder()
    @left.postorder {|y| yield y} if @left != nil
    @right.postorder {|y| yield y} if @right != nil
    yield @data
  end
 
end

items2 = [50, 20, 80, 10, 30, 70, 90, 5, 14,
            28, 41, 66, 75, 88, 96]
tree2 = Tree.new

items2.each {|x| tree2.insert(x)}

tree2.inorder {|x| print x, " "}
print "\n"
tree2.preorder {|x| print x, " "}
print "\n"
tree2.postorder {|x| print x, " "}
print "\n"

puts
puts "9.3.3. Использование Двоичного Дерева Как Справочной Таблицы"

class Tree
  attr_accessor :left
  attr_accessor :right
  attr_accessor :data

  def initialize(x=nil)
    @left = nil
    @right = nil
    @data = x
  end

  def insert(x)
    if @data == nil
      @data = x
    elsif x <= @data
      if @left == nil
        @left = Tree.new x
      else
        @left.insert x
      end
    else
      if @right == nil
        @right = Tree.new x
      else
        @right.insert x
      end
    end
  end

  def search(x)
    if self.data == x
      return self
    elsif x < self.data
      return left ? left.search(x) :nil
    else
      return right ? right.search(x) :nil
    end
  end
 
end

keys = [50, 20, 80, 10, 30, 70, 90, 5, 14,
           28, 41, 66, 75, 88, 96]

tree3 = Tree.new

keys.each {|x| tree3.insert(x)}

p tree3.search(75)
p tree3.search(100)

puts
puts "9.3.4. Преобразование Дерева В Строку Или Массив"

class Tree
  attr_accessor :left
  attr_accessor :right
  attr_accessor :data

  def initialize(x=nil)
    @left = nil
    @right = nil
    @data = x
  end

  def insert(x)
    if @data == nil
      @data = x
    elsif x <= @data
      if @left == nil
        @left = Tree.new x
      else
        @left.insert x
      end
    else
      if @right == nil
        @right = Tree.new x
      else
        @right.insert x
      end
    end
  end

  def to_s
    "["+
    if left then left.to_s + "," else "" end +
      data.inspect +
    if right then "," + right.to_s else "" end + "]"
  end

  def to_a
    temp = []
    temp += left.to_a if left
    temp << data
    temp += right.to_a if right
    temp
  end

end

items3 = %w[bongo grimace monoid jewel plover nexus synergy]
tree4 = Tree.new
items3.each {|x| tree4.insert x}
p tree4.to_a * ","
p tree4.to_a

puts
puts "9.4. Графы"

puts
puts "9.4.1. Реализация Графа В Виде Матрицы Смежности"

class ZArray < Array
 
    def [](x)
     if x > size
      for i in size+1..x
       self[i]=0
      end
     end
     v = super(x)
    end
 
    def []=(x,v)
     max = size
     super(x,v)
     if size - max > 1
      (max..size-2).each do |i|
       self[i] = 0
      end
     end
    end
 
end

class TriMatrix
 
    def initialize
     @store = []
    end
 
    def []=(x,y)
     if x > у
      index = (x*x+x)/2 + y
      @store[index]
     else
      raise IndexError
     end
    end
 
    def []=(x,y,v)
     if x > y
      index = (x*x+x)/2 + y
      @store[index] = v
     else
      raise IndexError
     end
    end
 
end

puts "Листинг 9.3. Матрица Смежности"

class LowerMatrix < TriMatrix

  def initialize
    @store = ZArray.new
  end

end

class Graph

  def initialize(*edges)
    @store = LowerMatrix.new
    @max = 0
    for e in edges
      e[0], e[1] = e[1], e[0] if e[1] > e[0]
      @store[e[0],e[1]] = 1
      @max = [@max, e[0], e[1]].max
    end
  end

  def [](x,y)
    if x > y
      @store[x,y]
    elsif x < y 
      @store[y,x]
    else
      0
    end
  end

  def []=(x,y,v)
    if x > y
      @store[x,y]=v
    elsif x < y 
      @store[y,x]=v
    else
      0
    end
  end

  def edge? x,y
    x,y = y,x if x < y
    @store[x,y] == 1
  end

  def add x,y
    @store[x,y] = 1
  end

  def remove x,y
    x,y = y,x if x < y
    @store[x,y] = 0
    if (degree @max) == 0
      @max -=1
    end
  end

  def vmax
    @max
  end

  def degree x
    sum = 0
    0.upto @max do |i|
      sum += self[x,i]
    end
    sum
  end

  def each_vertex
    (0..@max).each {|v| yield v}
  end

  def each_edge
    for v0 in 0..@max 
      for v1 in 0..v0-1
        yield v0, v1 if self[v0,v1]==1
      end
    end
  end

end

mygraph = Graph.new([1,0],[0,3],[2,1],[3,1],[3,2])

mygraph.each_vertex {|v| puts mygraph.degree(v)}
#Не работает маза фака (



        
        



       



