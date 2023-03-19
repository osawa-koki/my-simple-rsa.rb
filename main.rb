require 'optparse'
require_relative './util/fn.getPublicKey'
require_relative './util/fn.getPrivateKey'
require_relative './util/fn.encrypt'
require_relative './util/fn.decrypt'
require_relative './util/fn.isPrime'

options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: example.rb [options]'

  opts.on('-p1', '--prime1 PRIME1', Integer, 'Prime number 1') do |prime1|
    options[:prime1] = prime1
  end

  opts.on('-p2', '--prime2 PRIME2', Integer, 'Prime number 2') do |prime2|
    options[:prime2] = prime2
  end

  opts.on('-m', '--message MESSAGE', String, 'Message to encrypt') do |message|
    options[:message] = message
  end

  opts.on('-h', '--help', 'Prints this help') do
    puts opts
    exit
  end
end.parse!

prime1 = options[:prime1]
prime2 = options[:prime2]
message = options[:message]

if prime1.nil? || prime2.nil? || message.nil?
  puts 'Prime numbers and message are required.'
  exit
end

if is_prime(prime1) == false
  raise 'prime1 is not a prime number.'
end

if is_prime(prime2) == false
  raise 'prime2 is not a prime number.'
end

if prime1 == prime2
  raise 'prime1 and prime2 must be different.'
end

# 公開鍵・秘密鍵を生成する
publicKey = get_public_key(prime1, prime2)
if publicKey.nil?
  raise 'publicKey is null.'
end
puts "公開鍵: #{publicKey}"

privateKey = get_private_key(prime1, prime2, publicKey)
if privateKey.nil?
  raise 'privateKey is null.'
end
puts "秘密鍵: #{privateKey}"

encrypted = encrypt(publicKey, message)

# 暗号化されたデータを復号する
decrypted = decrypt(privateKey, encrypted)

puts "元のメッセージ: #{message}"
puts "暗号化されたメッセージ: #{encrypted}"
puts "復号化されたメッセージ: #{decrypted}"
