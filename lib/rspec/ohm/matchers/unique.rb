
module RSpec
  module Ohm
    define :have_unique do |expected|
      match do |actual|
        actual.class.uniques.include? expected
      end

      failure_message do |actual|
        "expected #{actual.class} to track unique :#{expected}"
      end
    end
  end
end
