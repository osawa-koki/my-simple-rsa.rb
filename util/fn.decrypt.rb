require 'uri'
require_relative './fn.modExp'

# 秘密鍵を用いて暗号化されたデータを復号します。
#
# @param privateKey [Array<Integer>] 復号に使用する秘密鍵。
# @param encrypted [String] 暗号化されたデータ。
# @return [String] 復号されたデータ。
def decrypt(private_key, encrypted)
  n, d = private_key
  block_size = (Math.log10(n) / Math.log10(2)).floor - 1
  encrypted_blocks = encrypted.scan(/.{1,#{block_size + 1}}/) || []
  decrypted_chars = encrypted_blocks.map do |block|
    num = block.to_i
    mod_exp(num, d, n)
  end
  decrypted_string = decrypted_chars.pack('U*')
  decoded_string = URI.decode_www_form_component(decrypted_string)
  decoded_string
end
