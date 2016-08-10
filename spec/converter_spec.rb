require 'spec_helper'

describe Converter do
  let(:test_array) { %w(A B C D F) }
  let(:test_hash) { { A: 1, B: 1, C: 0, D: 0, F: 0 } }
  let(:error_type) { Undecided::DeciderError }
  it 'convert arrays or hash keys to symbol' do
    expect { throw Converter.to_symbol(test_array).first }.to throw_symbol
    expect { throw Converter.to_symbol(test_hash).keys.first }.to throw_symbol
    expect { throw Converter.to_symbol('A') }.to throw_symbol
    expect { throw Converter.to_symbol(1) }.to throw_symbol
  end

  it 'convert hash values to boolean type' do
    expect(Converter.hash_values_to_bool(a: 1).values.first).to eql(true)
    expect(Converter.hash_values_to_bool(a: 0).values.first).to eql(false)
    expect(Converter.hash_values_to_bool(a: true).values.first).to eql(true)
    expect(Converter.hash_values_to_bool(a: 0).values.first).to eql(false)
    expect { Converter.hash_values_to_bool(a: 'a').values.first }.to raise_error(error_type)
    expect { Converter.hash_values_to_bool(a: :a).values.first }.to raise_error(error_type)
  end

  it 'convert values to boolean type' do
    expect(Converter.to_bool(1)).to eql(true)
    expect(Converter.to_bool(0)).to eql(false)
    expect(Converter.to_bool(true)).to eql(true)
    expect(Converter.to_bool(false)).to eql(false)
    expect { Converter.to_bool('a') }.to raise_error(error_type)
    expect { Converter.to_bool(:a) }.to raise_error(error_type)
  end
end
