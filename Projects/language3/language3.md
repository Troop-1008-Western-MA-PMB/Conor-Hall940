require "io/console"

def calculate(num1 : Float64, num2 : Float64, operation : Char) : Float64
  case operation
  when '+'
    num1 + num2
  when '-'
    num1 - num2
  when '*'
    num1 * num2
  when '/'
    if num2 = 0
      raise "Division by zero"
    end
    num1 / num2
  else
    raise "Invalid operation"
  end
end

print "Enter the first number: "
num1 = gets.chomp.to_f

print "Enter the operation (+, -, *, /): "
operation = gets.chomp.chars.first

print "Enter the second number: "
num2 = gets.chomp.to_f

begin
  result = calculate(num1, num2, operation)
  puts "Result: #{result}"
rescue ex : Exception
  puts "Error: #{ex.message}"
end
