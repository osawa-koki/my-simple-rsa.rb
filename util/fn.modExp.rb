
# 高速なmod演算を用いて a^b (mod m) を計算する関数。
# @param a [Integer] 底数。
# @param b [Integer] 指数。
# @param m [Integer] 除数。
# @return [Integer] a^b (mod m) の結果。
def mod_exp(a, b, m)
  result = 1
  while b > 0
    if b % 2 == 1
      result = (result * a) % m
    end
    a = (a * a) % m
    b = b / 2.floor
  end
  return result
end
