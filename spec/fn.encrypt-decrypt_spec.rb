require_relative '../util/fn.getPublicKey'
require_relative '../util/fn.getPrivateKey'
require_relative '../util/fn.encrypt'
require_relative '../util/fn.decrypt'

primes = [
  11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83,
  89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167,
  173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251,
  257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347,
  349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433,
  439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523,
  541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619,
  631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727,
  733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827,
  829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937,
  941, 947, 953, 967, 971, 977, 983, 991, 997,
]
messages = [
  'dog',
  'cat',
  'bird',
  'fish',
  'rabbit',
  'hamster',
  'snake',
  'lizard',
  'frog',
  'turtle',
  'horse',
  'cow',
  'pig',
  'sheep',
  'goat',
  'chicken',
  'duck',
  'goose',
  'deer',
  'bear',
  'wolf',
  'fox',
  'squirrel',
  'mouse',
  'rat',
  '123',
  '%%%',
  '!!!',
  '###',
  '&&&',
  '***',
  '???',
  '...',
  '---',
  '___',
  '+++',
  '===',
  '^^^',
  '|||',
  '<<<',
  '>>>',
  'あいうえお',
  'かきくけこ',
  'さしすせそ',
  'たちつてと',
  'なにぬねの',
  'はひふへほ',
  'まみむめも',
  'やゆよ',
  'らりるれろ',
  'わをん',
  'アイウエオ',
  'カキクケコ',
  'サシスセソ',
  'タチツテト',
  'ナニヌネノ',
  'ハヒフヘホ',
  'マミムメモ',
  'ヤユヨ',
  'ラリルレロ',
  'ワヲン',
  '電子計算機',
  '電子計算機科学',
]

describe 'Encrypt-Decrypt' do
  100.times do |i|
    prime1 = primes.sample
    prime2 = primes.sample
    message = messages.sample

    next if prime1 == prime2

    # 公開鍵を生成する
    publicKey = get_public_key(prime1, prime2)
    raise "publicKey is null: prime1: #{prime1}, prime2: #{prime2}" if publicKey.nil?

    # 秘密鍵を生成する
    privateKey = get_private_key(prime1, prime2, publicKey)
    raise "privateKey is null: prime1: #{prime1}, prime2: #{prime2}" if privateKey.nil?

    # データを暗号化する
    encrypted = encrypt(publicKey, message)

    # 暗号化されたデータを復号する
    decrypted = decrypt(privateKey, encrypted)

    # テストケースを実行する
    it "Encrypt-Decrypt: #{message} | prime1: #{prime1}, prime2: #{prime2}, message: #{message}" do
      expect(decrypted).to eq message
    end
  end
end
