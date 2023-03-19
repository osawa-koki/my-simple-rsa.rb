require_relative '../util/fn.isPrime'

describe 'is_prime' do
  let(:test_cases) do
    [
      { input: 0, expected_output: false },
      { input: 1, expected_output: false },
      { input: 2, expected_output: true },
      { input: 3, expected_output: true },
      { input: 4, expected_output: false },
      { input: 5, expected_output: true },
      { input: 6, expected_output: false },
      { input: 7, expected_output: true },
      { input: 8, expected_output: false },
      { input: 9, expected_output: false },
      { input: 10, expected_output: false },
      { input: 11, expected_output: true },
      { input: 12, expected_output: false },
      { input: 13, expected_output: true },
      { input: 97, expected_output: true },
      { input: 100, expected_output: false },
      { input: 113, expected_output: true },
      { input: 123456789, expected_output: false },
      { input: 2147483647, expected_output: true },
    ]
  end

  it 'returns whether a number is prime or not' do
    test_cases.each do |test_case|
      input = test_case[:input]
      expected_output = test_case[:expected_output]

      expect(is_prime(input)).to eq(expected_output)
    end
  end
end
