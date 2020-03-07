#Charles Thomas
#Lab 2 Ruby portion
#2020_2_14

#!/usr/bin/ruby -w

#factors returns an array of factors of the parameter number
#does not include itself
def factors(num)
  @f = Array.new
  @i = 1

  until @i > (num / 2) do
    if num % @i == 0
      @f.append(@i)
    end
    @i +=1
  end
  #puts "The number", num, "has factors: #{@f}"
  #puts ""

  return @f
end

#perfect_number returns a boolean. True if a num is perfect
def perfect_number(num)
  @sum = 0
  @a = factors(num)

  @a.each do |factor|
    @sum += factor
  end

  #puts "num is", num
  #puts "sum is #{@sum}"

  if @sum == num
    return true
  else
    return false
  end
end

#perfect_range finds all the perfect numbers from 0 to y, inclusive
def perfect_range(y)
  @j = (2..y)
  @g = Array.new
  @temp = 0

  @j.each do |n|
    if (perfect_number n) == true
      @g.append(n)
    end
  end

  return @g
end

#prime_range finds all the prime numbers from 0 to y, inclusive
def prime_range(y)
  @j = (2..y)
  @g = Array.new
  @temp = 0

  @j.each do |n|
    if (isPrime n) == true
      @g.append(n)
    end
  end

  return @g
end

#helper method for isPrime(), if prime is not 2 recurse
def prime(n, x)
  if x >= n-1
    return true
  elsif n % x == 0
    return false
  else
    prime n, (x+1)
  end
end

#determines if the number n is prime
def isPrime(n)
  if n < 0
    n = -n
  end
  if n < 2
    return false
  elsif n == 2
    return true
  elsif n % 2 == 0
    return false
  else
    prime n, 3
  end
end

=begin
taken from
https://github.com/exercism/ruby/blob/master/exercises/perfect-numbers/.meta/solutions/perfect_numbers.rb
=end
class PerfectNumber
  def self.classify(num)
    raise 'not a natural number' if num < 0
    aliquot_sum = aliquot_sum(num)
    aliquot_sum == num ? "perfect" : aliquot_sum < num ? "deficient" : 'abundant'
  end

  def self.aliquot_sum(num)
    get_divisors(num).reduce(:+)
  end

  private

  def self.get_divisors(num)
    divisors = [0]
    (1..Math.sqrt(num)).each do |n|
      if num % n == 0
        divisors << n
        divisors << num/n unless (n == 1) || (num/n) == n
      end
    end
    divisors
  end

  #method I added to find perfect numbers in given range
  def self.perfect_range(y)
    @j = (2..y)
    @g = Array.new
    @temp = 0

    @j.each do |n|
      if aliquot_sum(n) == n
        @g.append(n)
      end
    end

    return @g
  end
end

=begin taken from
http://lortza.github.io/2017/09/22/prime-numbers-in-ruby.html
=end
def is_prime(num)
  (2..(num - 1)).each do |n|
    return false if num % n == 0
  end
  true
end

#prime_range finds all the prime numbers from 0 to y, inclusive
def prime_range2(y)
  @j = (2..y)
  @g = Array.new
  @temp = 0

  @j.each do |n|
    if (is_prime n) == true
      @g.append(n)
    end
  end

  return @g
end

puts prime_range2(10000)
puts is_prime(7)
puts is_prime(12)
puts is_prime(203)

=begin
puts PerfectNumber.classify(6)
puts PerfectNumber.classify(10)
puts PerfectNumber.classify(116)
puts PerfectNumber.perfect_range(10000)
puts "prime numbers from 2-10,000: "
puts prime_range 10000
puts ""
puts "Are these prime?"
puts isPrime (-5)
puts isPrime 100
puts isPrime 23
puts isPrime 1
=end

#puts prime_range 10000
#puts isPrime 30
#puts factors 28
#puts perfect_number 28
