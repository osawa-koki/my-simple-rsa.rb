
# 受け取った数値が素数かどうかを判定する関数。
# @param n [Integer] 判定する数値
# @return [Boolean] 素数ならtrue、そうでなければfalse
def is_prime(n)
  return false if n < 2

  2.upto(Math.sqrt(n)) do |i|
    return false if n % i == 0
  end

  return true
end
