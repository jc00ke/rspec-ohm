require "spec_helper"

RSpec.describe "#have_unique matcher" do
  class Foo < Ohm::Model
    attribute :name
    unique    :name
  end

  let(:model) {
    Foo.new
  }

  context "when the model has the uniqueness constraint" do
    it "matches" do
      expect(model).to have_unique(:name)
    end
  end

  context "when the model doesn't have the uniqueness constraint" do
    it "includes the attribute in the failure message" do
      expect {
        expect(model).to have_unique(:bar)
      }.to raise_error { |e|
        expect(e.message).to match(/bar/)
      }
    end
  end
end
