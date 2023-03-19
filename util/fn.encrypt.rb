require_relative 'fn.modExp'

# 指定された公開鍵でデータをRSA暗号化します。
# @param publicKey [Array<Integer>] 公開鍵[n, e]。
# @param message [String] 暗号化するデータ。
# @return [String] 暗号化されたデータ。
def encrypt(public_key, message)
  _message = URI.encode_www_form_component(message)
  n, e = public_key
  block_size = (Math.log10(n) / Math.log10(2)).floor - 1
  blocks = _message.chars.each_slice(block_size).map { |slice| slice.join.ljust(block_size, '0') }
  encrypted_blocks = blocks.map { |block| mod_exp(block.to_i, e, n).to_s.rjust(block_size + 1, '0') }
  encrypted_blocks.join
end
