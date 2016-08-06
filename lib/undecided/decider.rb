module Undecided
  # Evaluate boolean expression
  class Decider
    def initialize
      @evaluator = Undecided::Evaluator.new
    end

    # Given a boolean expression and data to replace, return result
    def decide(rule, values)
      @rule = rule
      @values = values
      raise 'Wrong data to perform' unless @evaluator.valid?(rule, values)
      # Sanitize data
      sanitize
      # Eval rules and values after process it, with safe data
      eval rule
    end

    # Sanitize params to transform data to a standar way
    def sanitize
      # Transform every keys to symbol
      @values = Converter.to_symbol @values
      # Transform every value to a boolean type
      @values = values_to_bool
      # Replace every variable from rules with values
      replacing_variables
    end

    # Convert every value from hash to a boolean value
    def values_to_bool
      raise 'Only hash values' unless @values.is_a? Hash
      @values.map { |k, v| [k, Converter.to_bool(v)] }.to_h
    end

    # Replaces variables from rules with values
    def replacing_variables
      @values.each do |k, v|
        @rule.gsub! k.to_s, v.to_s
      end
    end
  end
end
