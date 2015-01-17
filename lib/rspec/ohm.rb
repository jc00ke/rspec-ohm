require "ohm"

require "rspec"
require "rspec/core"
require "rspec/expectations"

module RSpec
  module Ohm
    extend RSpec::Matchers::DSL
  end
end

require "rspec/ohm/version"
require "rspec/ohm/matchers/attributes"
require "rspec/ohm/matchers/set"
require "rspec/ohm/matchers/unique"
