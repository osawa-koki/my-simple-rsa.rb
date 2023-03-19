require_relative '../util/fn.lcm'

# 公開鍵と素数二つから秘密鍵を計算する。
# @param p [Integer] 素数1。
# @param q [Integer] 素数2。
# @param public_key [Array<Integer>] 公開鍵[n, e]。
# @return [Array<Integer>, nil] 秘密鍵[n, d]。
def get_private_key(p, q, public_key)
  n, e = public_key
  phi = lcm(p - 1, q - 1)
  d = mod_inv(e, phi)

  return nil if p == q

  # dが正の数になるようにする
  d += phi while d < 0
  [n, d]
end

# aのmod mにおける逆元を返す。存在しない場合はエラーを返す。
# @param a [Integer] 逆元を求める数。
# @param m [Integer] 剰余の値。
# @return [Integer] aのmod mにおける逆元。
# @raise [StandardError] 逆元が存在しない場合、エラーを返す。
def mod_inv(a, m)
  gcd_val, x = ext_euclidean(a, m)
  raise "a = #{a}(mod #{m})における逆元が存在しません。" if gcd_val != 1
  (x % m + m) % m
end

# 拡張ユークリッド互除法。ax + by = gcd(a, b)を満たす[gcd(a, b), x, y]を返す。
# @param a [Integer] 整数1。
# @param b [Integer] 整数2。
# @return [Array<Integer>] [gcd(a, b), x, y]。ax + by = gcd(a, b)を満たす。
def ext_euclidean(a, b)
  x, y, u, v = 0, 1, 1, 0
  while a != 0
    q, r = b.divmod(a)
    m, n = x - u * q, y - v * q
    b, a, x, y, u, v = a, r, u, v, m, n
  end
  [b, x, y]
end
