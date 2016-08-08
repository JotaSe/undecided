# Convert data to required type
class Converter
  def self.process_values(values)
    values = to_symbol(values)
    hash_values_to_bool(values)
  end

  # Convert array, hash's keys or solo values to symbol
  def self.to_symbol(value)
    if value.is_a?(Array)
      value.map(&:to_sym)
    elsif value.is_a? Hash
      value.map { |k, v| [k.to_sym, v] }.to_h
    else
      # for String and Number solo values
      value.to_s.to_sym
    end
  end

  # Convert every value from hash to a boolean value
  def self.hash_values_to_bool(values)
    raise 'Only hash values' unless values.is_a? Hash
    values.map { |k, v| [k, to_bool(v)] }.to_h
  end

  # Transform value to boolean
  def self.to_bool(value)
    # if boolean return value
    return value if Undecided::Evaluator.bool?(value)
    # transform integer value to boolean
    !value.zero?
  rescue
    raise "#{value} Is not a correct value, " \
          'insert (1 or 0) or (true or false)'
  end

  # Replaces variables from rules with values
  def self.replacing_variables(rule, values)
    process_values(values).each do |k, v|
      rule.gsub! k.to_s, v.to_s
    end
    rule
  end
end
