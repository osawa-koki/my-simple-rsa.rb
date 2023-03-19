
# ユークリッドの互除法を使って、2つの数の最大公約数を返す関数。
# @param a [Integer] 1つ目の数。
# @param b [Integer] 2つ目の数。
# @raise [ArgumentError] 引数が正の整数でない場合。
# @return [Integer] aとbの最大公約数。
def gcd(a, b)
  raise ArgumentError, '引数は正の整数である必要があります。' if a < 0 || b < 0
  raise ArgumentError, '引数は正の整数である必要があります。' if !a.is_a?(Integer) || !b.is_a?(Integer)

  return b if a == 0
  return a if b == 0

  return gcd(b, a % b)
end
