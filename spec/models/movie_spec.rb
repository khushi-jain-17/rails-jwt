require 'rails_helper'

RSpec.describe Movie, type: :model do
  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:rating) }
  it { should belong_to(:user) }
  it { should belong_to(:category) }
  it { should have_many(:users) }
  it { should have_many(:reviews) }
 
end
