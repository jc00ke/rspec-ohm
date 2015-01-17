module RSpec
  module Ohm
    define :have_set_of do |expected_set_name|
      match do |actual|
        actual.save
        responds_to = actual.respond_to?(expected_set_name.to_sym)
        with_class = if @klass
                       @actual_klass = actual.send(expected_set_name).model
                       @klass == @actual_klass
                     else
                       true
                     end
        responds_to && with_class
      end

      chain :with_class do |klass|
        @klass = klass
      end

      failure_message do |actual|
        klass_msg = " of type #{@klass} but had type #{@actual_klass}" if @klass
        "expected #{actual.class} to have a set of :#{expected}#{klass_msg}"
      end
    end
  end
end
