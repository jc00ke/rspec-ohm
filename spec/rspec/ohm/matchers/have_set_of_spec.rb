require "spec_helper"

RSpec.describe "#have_set_of matcher" do
  class Bar < Ohm::Model; end
  class Baz < Ohm::Model; end

  class Foo < Ohm::Model
    set :widgets, :Bar
  end

  class Qux < Ohm::Model
    set :widgets, :Baz
  end

  let(:model) {
    Foo.new
  }

  context "when the model has the set" do
    it "matches" do
      expect(model).to have_set_of(:widgets)
    end
  end

  context "chained #with_class" do
    context "with the class" do
      it "matches" do
        expect(model).to have_set_of(:widgets).with_class(Bar)
      end
    end

    context "without the class" do

      let(:model) {
        Qux.new
      }
      it "includes the expected class in the failure message" do
        expect {
          expect(model).to have_set_of(:widgets).with_class(Bar)
        }.to raise_error { |e|
          expect(e.message).to match(/Bar/)
          expect(e.message).to match(/Baz/)
        }
      end
    end
  end
end
