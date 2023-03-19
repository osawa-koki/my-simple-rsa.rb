require_relative './fn.gcd'

# 2つの素数を受け取り、公開鍵を返します。
# @param p [Integer] p (素数1)
# @param q [Integer] q (素数2)
# @return [Array<Integer>] 公開鍵 (n, e)、もしくは nil
def get_public_key(p, q)
  n = p * q
  phi = (p - 1) * (q - 1)
  e = 65537  # The default value for the public exponent.

  return nil if p == q

  while gcd(e, phi) != 1
    e += 1
  end

  [n, e]
end
