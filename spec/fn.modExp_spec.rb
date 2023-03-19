require_relative '../util/fn.modExp'

describe 'mod_exp' do
  let(:test_cases) do
    [
      { inputs: [2, 5, 13], expected_output: 6 },
      { inputs: [3, 7, 13], expected_output: 3 },
      { inputs: [5, 11, 13], expected_output: 8 },
      { inputs: [7, 13, 13], expected_output: 7 },
      { inputs: [11, 17, 13], expected_output: 7 },
      { inputs: [13, 19, 13], expected_output: 0 },
      { inputs: [17, 23, 13], expected_output: 10 },
      { inputs: [19, 29, 13], expected_output: 2 },
      { inputs: [23, 31, 13], expected_output: 10 },
      { inputs: [29, 37, 13], expected_output: 3 },
    ]
  end

  it 'returns the result of a^b (mod m)' do
    test_cases.each do |test_case|
      inputs = test_case[:inputs]
      expected_output = test_case[:expected_output]

      expect(mod_exp(*inputs)).to eq(expected_output)
    end
  end
end
