require_relative '../util/fn.gcd'

describe 'gcd' do
  let(:test_cases) do
    [
      { inputs: [2, 3], expected_output: 1 },
      { inputs: [10, 25], expected_output: 5 },
      { inputs: [14, 21], expected_output: 7 },
      { inputs: [15, 18], expected_output: 3 },
      { inputs: [35, 49], expected_output: 7 },
      { inputs: [100, 125], expected_output: 25 },
      { inputs: [72, 96], expected_output: 24 },
      { inputs: [168, 216], expected_output: 24 },
      { inputs: [111, 123], expected_output: 3 },
      { inputs: [222, 123], expected_output: 3 },
      { inputs: [0, 0], expected_output: 0 },
    ]
  end

  it 'returns the greatest common divisor of two numbers' do
    test_cases.each do |test_case|
      a, b = test_case[:inputs]
      expected_output = test_case[:expected_output]

      expect(gcd(a, b)).to eq(expected_output)
      expect(gcd(b, a)).to eq(expected_output)
    end
  end

  let(:bad_test_cases) do
    [
      { inputs: [2.5, 3] },
      { inputs: [2, 3.5] },
      { inputs: [-2, 3] },
      { inputs: [2, -3] },
    ]
  end

  it 'raises an ArgumentError when arguments are not positive integers' do
    bad_test_cases.each do |bad_test_case|
      a, b = bad_test_case[:inputs]

      expect { gcd(a, b) }.to raise_error(ArgumentError)
      expect { gcd(b, a) }.to raise_error(ArgumentError)
    end
  end
end
