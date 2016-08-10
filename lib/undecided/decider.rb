module Undecided
  class DeciderError < StandardError
  end
  # Evaluate boolean expression
  class Decider
    # Given a boolean expression and data to replace, return result
    def decide(rule, values, strict = true)
      error unless Undecided::Evaluator.valid?(rule, values, strict)
      # Sanitize data
      # Eval rules and values after process it, with safe data
      final_expression = Converter.replacing_variables(rule, values)
      eval final_expression
    rescue => e
      puts e.message
      error
    end

    def error
      raise DeciderError, 'Wrong data to perform'
    end
  end
end
