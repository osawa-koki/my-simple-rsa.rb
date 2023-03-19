require_relative './fn.gcd'

# 2つの数の最小公倍数を返す関数。
# @param a [Integer] 1つ目の数。
# @param b [Integer] 2つ目の数。
# @raise [ArgumentError] 引数が整数でない場合、または正の整数でない場合。
# @return [Integer] aとbの最小公倍数。
def lcm(a, b)
  raise ArgumentError, '引数は整数である必要があります。' if !a.is_a?(Integer) || !b.is_a?(Integer)
  raise ArgumentError, '引数は正の整数である必要があります。' if a < 0 || b < 0

  return 0 if a == 0 || b == 0

  return (a * b) / gcd(a, b)
end
