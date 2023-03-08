require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryGirl.create(:user)
  end

  describe "validations" do
    it "can be created" do
      expect(@user).to be_valid        
    end

    it "cannot be created without first name" do
      @user.first_name = nil
      expect(@user).to_not be_valid      
    end

    it "cannot be created without last name" do
      @user.last_name = nil
      expect(@user).to_not be_valid      
    end

    it "cannot be created without phone number" do
      @user.phone = nil
      expect(@user).to_not be_valid      
    end

    it "can be created with integer only" do
      @user.phone = "mygreatstr"
      expect(@user).to_not be_valid 
    end

    it "can have only 10 chars" do
      @user.phone = "12345678901"
      expect(@user).to_not be_valid 
    end
  end
  

  describe "custom name method" do
    it "will have full_name method that combines first and last name" do
      expect(@user.full_name).to eq("UMAIR, AHMED")  
    end
  end
  

end
