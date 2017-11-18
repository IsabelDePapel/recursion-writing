# Authoring recursive algorithms. Add comments including time and space complexity for each method.

# time: O(n) because it needs to execute n times to calculate factorial
# space: O(n) because of the stack space (n calls to factorial)
def factorial(n)
  if n == 0 || n == 1
    return 1
  else
    return n * (factorial n - 1)
  end
end

# time: O(n) because it needs to execute n times to reverse the string
# space: O(n) because there are n calls on the stack (O(n)) plus O(n) for creating the new string, which is O(2n), which simplifies to O(n)
def reverse(s, reversed = "", idx = s.length - 1)
  len = s.length

  if len == 0 || len == 1
    return s
  # if end of string
  elsif idx < 0
    return reversed
  else
    reversed << s[idx]
    return reverse(s, reversed, idx - 1)
  end
end

# time: O(n) because it makes n/2 calls to the function (which simplifies to O(n))
# space: O(n) because the reversal is in place, but there are n/2 calls on the stack, which simplifies to O(n)
def reverse_inplace(s, start_idx = 0, end_idx = s.length - 1)
  len = (end_idx - start_idx + 1)

  if len == 0 || len == 1
    return s
  else
    # swap outer chars
    temp = s[start_idx]
    s[start_idx] = s[end_idx]
    s[end_idx] = temp

    return reverse_inplace(s, start_idx + 1, end_idx - 1)
  end
end

# time: O(n) because the function gets called n times
# space: O(n) because there are n calls to the function on the stack
def bunny(n)
  # n is num bunnies; each bunny has 2 ears; compute num ears
  if n == 0
    return 0
  else
    return 2 + bunny(n - 1)
  end
end

# time: O(n) because it makes n/2 calls to the function, which simplifies to O(n)
# space: O(n) for the same reason--n/2 calls on the stack, which simplifies to O(n)
def nested(s, start_idx = 0, end_idx = s.length - 1)
  # assumes empty string returns true
  len = (end_idx - start_idx + 1)

  if len.odd?
    return false
  elsif len == 0
    return true
  else
    if s[start_idx] != "(" || s[end_idx] != ")"
      return false
    else
      return nested(s, start_idx + 1, end_idx - 1)
    end
  end
end

# time: O(n) because it has to call the function n times to search the entire array
# space: O(n) because there will be n calls to the function on the stack to search the entire array
def search(array, value, idx = 0)
  # array is UNSORTED
  len = array.length

  return false if len == 0

  # if found
  if array[idx] == value
    return true
  # if end of array
  elsif idx + 1 == len
    return false
  # search rest of array
  else
    return search(array, value, idx + 1)
  end
end

# time: O(n) because it calls the function n/2 times, which simplifies to O(n)
# space: O(n) because there are n/2 function calls on the stack, which simplifies to O(n)
def is_palindrome(s, start_idx = 0, end_idx = s.length - 1)
  # assumes empty string is a palindrome
  len = (end_idx - start_idx + 1)

  if len == 0 || len == 1
    return true
  else
    if s[start_idx] != s[end_idx]
      return false
    else
      return is_palindrome(s, start_idx + 1, end_idx - 1)
    end
  end
end

# time: O(log m) where m is the smaller of the two integers. If there are k digits in m, it will make k calls to the function, and k is equal to log10(m) + 1
# space: O(log m) because there will be log m calls on the stack (and any additional memory used isn't dependent on input size)
def digit_match(n, m, matches = 0)
  if n == 0 || m == 0
    return matches
  else
    # check ones digit
    if n % 10 == m % 10
      matches += 1
    end

    return digit_match(n / 10, m / 10, matches)
  end
end

# time: O(n) because it uses memoization to save the calculations so that it has to call the function n times to calculate the needed sum
# space: O(n) because there will be n calls on the stack, and the helper array is only length 2 and its size doesn't change depending on input

# with memoization, bottom up
def fib(n, fib_nums = [0, 1], idx = 2)
  # initialize fib with first two vals in fib seq

  if n == 0 || n == 1
    return fib_nums[n]
  elsif idx == n
    return fib_nums[0] + fib_nums[1]
  else
    # recalc fib_nums in helper array
    cur_num = fib_nums[0] + fib_nums[1]
    fib_nums[0] = fib_nums[1]
    fib_nums[1] = cur_num

    return fib(n, fib_nums, idx + 1)
  end
end

# Factorial Tests
raise "factorial broke - factorial(4)" unless factorial(4) == 24
raise "factorial broke - factorial(0)" unless factorial(0) == 1
puts "passes all factorial tests"

# Reverse Tests
raise "reverse broke - reverse('hello world')" unless reverse("hello world") == "dlrow olleh"
raise "reverse broke - reverse('a b c')" unless reverse("a b c") == "c b a"
puts "passes all reverse tests"

# Reverse In place Tests
str_1 = 'hello world'
reverse_inplace(str_1)
raise "reverse broke - reverse_inplace('hello world')" unless str_1 == "dlrow olleh"
str_2 = 'a b c'
reverse_inplace(str_2)
raise "reverse broke - reverse_inplace('a b c')" unless str_2 == "c b a"
puts "passes all reverse_inplace tests"

# Bunny Tests
raise "bunny broke - bunny(0)" unless bunny(0) == 0
raise "bunny broke - bunny(10)" unless bunny(10) == 20
puts "passes all bunny tests"

# Nested Tests
raise "nested broke - nested('((()))')" unless nested("((()))") == true
raise "nested broke - nested('())')" unless nested("())") == false
puts "passes all nested tests"

# Search Tests
arr_1 = [34, 45, 21, 4, 67]
raise "search broke - search([34, 45, 21, 4, 67], 4)" unless search(arr_1, 4) == true
arr_2 = [24, 51, 11]
raise "search broke - search([24, 51, 11], 4)" unless search(arr_2, 4) == false
arr_3 = []
raise "search broke - search([], 4)" unless search(arr_3, 4) == false
puts "passes all search tests"

# Palindrome Tests
raise "is_palindrome broke - is_palindrome('racecar')" unless is_palindrome('racecar') == true
raise "is_palindrome broke - is_palindrome('smile')" unless is_palindrome('smile') == false
puts "passes all palindrome tests"

# Digit Match Tests
raise "digit_match broke - digit_match(1072503891, 62530841)" unless digit_match(1072503891, 62530841) == 4
raise "digit_match broke - digit_match(1234, 4321)" unless digit_match(1234, 4321) == 0
raise "digit_match broke - digit_match(3862947593, 3862947593)" unless digit_match(3862947593, 3862947593) == 10
puts "passes all digit_match tests"

# Fibonacci Tests
raise "fib broke - fib(4)" unless fib(4) == 3
raise "fib broke - fib(6)" unless fib(6) == 8
raise "fib broke - fib(9)" unless fib(9) == 34
# test recursion efficiency
puts fib(50)

puts "All test passed"
