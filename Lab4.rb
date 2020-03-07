#Charles Thomas
#Lab 2 Ruby portion
#2020_2_14

#!/usr/bin/ruby -w

class Num
  include Comparable
  def <=>(x)
    self.toFloat() <=> x.toFloat()
  end
end

#Fraction creates an object Fraction with numerator and denominator
class Fraction < Num
  #constructor
  def initialize(n, d)
    if d < 0
      @numerator = -n
      @denominator = -d
    else
      @numerator = n
      @denominator = d
    end
  end

  #accessor methods
  def toFloat
    num = @numerator
    denom = @denominator
    x = num.to_f / denom.to_f
    x
  end

  #getters
  def getNum
    num = @numerator
    num
  end

  def getDenom
    denom = @denominator
    denom
  end

  #Overloading equivalent of Eq
  def ==(f)
    self.toFloat() == f.toFloat()
  end
end

#Mixed creates an object of a Mixed Number with whole, numerator, and denominator
class Mixed < Num
  #constructor
  def initialize(w, n, d)
    if d < 0
      @whole = w
      @numerator = -n
      @denominator = -d
    else
      @whole = w
      @numerator = n
      @denominator = d
    end
  end

  #accessor methods
  def toFloat
    wh = @whole
    num = @numerator
    denom = @denominator
    x = (num + (wh * denom)).to_f / denom.to_f
    x
  end

  #getters
  def getWhole
    wh = @whole
    wh
  end

  def getNum
    num = @numerator
    num
  end

  def getDenom
    denom = @denominator
    denom
  end

  #Overrides equivalent of Eq in Haskell
  def ==(f)
    self.toFloat() == f.toFloat()
  end
end

#Overloading equivalent of Show in Haskell
def puts(x)
  if x.is_a? Fraction #if Fraction
    s = "#{x.getNum()}/#{x.getDenom()}"
    super(s)
  elsif x.is_a? Mixed #if Mixed
    s = "#{x.getWhole()} #{x.getNum()}/#{x.getDenom()}"
    super(s)
  else
    super(x)
  end
end

#create a Fraction
fraction1 = Fraction.new(1, 2)
fraction2 = Fraction.new(3, 4)
puts "These are examples of overloading the puts method in Ruby for my Fractions class..."
puts fraction1
puts fraction2
puts "This is an example of overloading the == operator using Fractions..."
puts fraction2 == fraction1

#create a Mixed number
mixed1 = Mixed.new(3, 1, 2)
mixed2 = Mixed.new(3, 3, 4)
puts "These are examples of overloading the puts method in Ruby for my Mixed class..."
puts mixed1
puts mixed2
puts "This is an example of overloading the == operator using Mixed..."
puts mixed1 == mixed2

puts "This is an example of overloading the Comparable function in Ruby..."
puts mixed1 < fraction1

=begin
OUTPUT
These are examples of overloading the puts method in Ruby for my Fractions class...
1/2
3/4
This is an example of overloading the == operator using Fractions...
false
These are examples of overloading the puts method in Ruby for my Mixed class...
3 1/2
3 3/4
This is an example of overloading the == operator using Mixed...
false
This is an example of overloading the Comparable function in Ruby...
false
[Finished in 0.324s]
=end
