require "spec_helper"

RSpec.describe "#have_attribute matcher" do
  let(:model) {
    Class.new(Ohm::Model) do
      attribute :name
    end.new
  }

  context "when the model has the attribute" do
    it "matches" do
      expect(model).to have_attribute(:name)
    end
  end

  context "chained #with_index" do
    context "with the index" do
      let(:model) {
        Class.new(Ohm::Model) do
          attribute :name
          index     :name
        end.new
      }
      it "matches" do
        expect(model).to have_attribute(:name).with_index
      end
    end

    context "without the index" do
      it "includes expected attribute in failure message" do
        expect {
          expect(model).to have_attribute(:name).with_index
        }.to raise_error { |e|
          expect(e.message).to match(/index/)
        }
      end
    end
  end

  context "when the model doesn't have the attribute" do
    it "doesn't match" do
      expect {
        expect(model).to have_attribute(:asdf)
      }
    end

    it "includes expected attribute in failure message" do
      expect {
        expect(model).to have_attribute(:asdf)
      }.to raise_error { |e|
        expect(e.message).to match(/asdf/)
      }
    end
  end

end
