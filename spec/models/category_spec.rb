require 'rails_helper'

RSpec.describe Category, type: :model do
 
  subject {
    described_class.new(name: "Hollywood")
  } 
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  end

  describe 'association' do
    it { should have_many(:movies) }
  end

end
