module RSpec
  module Ohm
    extend RSpec::Matchers::DSL

    define :have_attribute do |expected|
      match do |actual|
        included = actual.class.attributes.include?(expected)
        if defined?(@with_index) && @with_index
          return included && actual.class.indices.include?(expected)
        end
        included
      end

      chain :with_index do
        @with_index = true
      end

      failure_message do |actual|
        index_msg = " with index" if @with_index
        "expected #{actual.to_s} to have :#{expected} attribute#{index_msg}"
      end
    end
  end
end
