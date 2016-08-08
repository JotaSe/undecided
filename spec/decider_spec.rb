require 'spec_helper'

describe Undecided::Decider do
  let(:decider) { Undecided::Decider.new }
  let(:rule_true) { 'A&B&!C|(!C|!A)|D&F' }
  let(:rule_false) { 'A&B&C&D&E&F' }
  let(:values) { { A: 1, B: 1, C: 0, D: 0, F: 0 } }

  it 'decide' do
    expect(decider.decide(rule_true, values)).to be true
  end

  it 'raise error when params are not an string and hash' do
    expect { decider.error }.to raise_error(Undecided::DeciderError)
    expect { decider.decide(1, 1) }.to raise_error(Undecided::DeciderError)
  end
end
