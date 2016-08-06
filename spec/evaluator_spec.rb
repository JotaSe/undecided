require 'spec_helper'

describe Undecided::Evaluator do
  let(:evaluator) { Undecided::Evaluator.new }
  let(:valid_expression) { 'A&B&!C|(!C|!A)|D&F' }
  let(:invalid_expression) { '!!!!!!' }
  let(:valid_values) { { A: 1, B: 1, C: 0, D: 0, F: 0 } }
  let(:invalid_values) { { A: 'asd', H: -1 } }

  it 'check if boolean type' do
    expect(false).to eq evaluator.bool?(1)
    expect(false).to eq evaluator.bool?(:sym)
    expect(true).to eq evaluator.bool?(true)
    expect(true).to eq evaluator.bool?(false)
  end

  it 'extract variables from boolean expression' do
    expect(evaluator.extract_variables(valid_expression)).not_to be_empty
    expect(evaluator.extract_variables(invalid_expression)).to be_empty
  end

  it 'check parameters are valid' do
    expect(true).to eq evaluator.valid?(valid_expression, valid_values)
    expect(false).to eq evaluator.valid?(valid_expression, invalid_values)
    expect(false).to eq evaluator.valid?(invalid_expression, invalid_values)
    expect(false).to eq evaluator.valid?(invalid_expression, valid_values)
  end
end
