require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "validations" do
   it { should validate_presence_of(:name) }
   it { should validate_presence_of(:rating) }
  end

  describe "associations" do
   it { should belong_to(:user) }
   it { should belong_to(:category) }
   it { should have_many(:users) }
   it { should have_many(:reviews) }
  end 
end
