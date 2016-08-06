require 'spec_helper'

describe Undecided do
  let(:validator) { Undecided::Validator.new }
  it 'has a version number' do
    expect(Undecided::VERSION).not_to be nil
  end
end
