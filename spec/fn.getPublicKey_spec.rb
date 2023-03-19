require_relative '../util/fn.getPublicKey'

RSpec.describe 'getPublicKey' do
  test_cases = [
    {
      inputs: [3, 5],
      expected_output: [15, 65537]
    },
    {
      inputs: [11, 17],
      expected_output: [187, 65537]
    },
    {
      inputs: [101, 103],
      expected_output: [10403, 65537]
    },
    {
      inputs: [631, 641],
      expected_output: [404471, 65537]
    },
    {
      inputs: [10007, 10009],
      expected_output: [100160063, 65537]
    }
  ]

  test_cases.each do |test_case|
    p, q = test_case[:inputs]
    n, e = test_case[:expected_output]

    it "returns [#{n}, #{e}] when called with (#{p}, #{q})" do
      expect(get_public_key(p, q)).to eq [n, e]
    end
  end
end
