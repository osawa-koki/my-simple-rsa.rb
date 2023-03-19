require_relative '../util/fn.getPrivateKey'

RSpec.describe 'getPrivateKey' do
  test_cases = [
    {
      p: 3,
      q: 5,
      publicKey: [15, 65537],
      expectedPrivateKey: [15, 1],
    },
    {
      p: 61,
      q: 53,
      publicKey: [3233, 17],
      expectedPrivateKey: [3233, 413],
    },
    {
      p: 71,
      q: 61,
      publicKey: [4979, 19],
      expectedPrivateKey: [4979, 199],
    },
  ]

  test_cases.each do |test_case|
    p = test_case[:p]
    q = test_case[:q]
    public_key = test_case[:publicKey]
    expected_private_key = test_case[:expectedPrivateKey]
    n, d = expected_private_key

    it "returns [#{n}, #{d}] when called with arguments (#{p}, #{q}, [#{public_key[0]}, #{public_key[1]}])" do
      expect(get_private_key(p, q, public_key)).to eq(expected_private_key)
    end
  end
end
