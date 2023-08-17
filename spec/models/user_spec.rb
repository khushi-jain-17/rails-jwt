require 'rails_helper'

RSpec.describe User, type: :model do
	
  describe "validations" do
	  it { should validate_presence_of(:email) }
    it { should validate_presence_of(:email) }
    it { should allow_value('user@example.com').for(:email) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should define_enum_for(:role).with_values(user: 0, admin: 1) }

    it "is not valid without a username" do
      user=User.new(username: nil)
      expect(user).to_not be_valid
    end

    it "is not valid without a email" do
      user=User.new(email: nil)
      expect(user).to_not be_valid
    end

    it "is not valid without a password" do
      user=User.new(password: nil)
      expect(user).to_not be_valid
    end
    
  end
  describe "associations" do    
    it { should have_many(:movies) }
    it { should have_many(:reviews) } 
  end

end
