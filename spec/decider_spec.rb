require 'spec_helper'

describe Undecided::Decider do
  let(:decider) { Undecided::Decider.new }
  let(:error_type) { Undecided::DeciderError }
  let(:rule_true) { 'A&B&!C|(!C|!A)|D&F' }
  let(:rule_false) { 'A&B&C&D&F' }
  let(:values) { { A: 1, B: 1, C: 0, D: 0, F: 0 } }
  let(:incomplete) { { D: 1, F: 1 } }

  it 'decide' do
    expect(decider.decide(rule_true, values)).to be true
    expect(decider.decide(rule_false, values)).to be false
  end

  it 'raise error for missing values when strict' do
    expect { decider.decide(rule_false, incomplete) }.to raise_error(error_type)
  end

  it 'decide with incomplete values' do
    expect(decider.decide(rule_false, incomplete, false)).to be false
    expect(decider.decide(rule_true, incomplete, false)).to be true
  end

  it 'raise error when params are not an string and hash' do
    expect { decider.error }.to raise_error(error_type)
    expect { decider.decide(1, 1) }.to raise_error(error_type)
  end
end
