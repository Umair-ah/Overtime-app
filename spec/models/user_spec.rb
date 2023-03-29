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

    it "cannot be created without ssn" do
      @user.ssn = nil
      expect(@user).to_not be_valid      
    end

    it "cannot be created without company name" do
      @user.company = nil
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

    it "can be created with integer only" do
      @user.ssn = "mygreatstr"
      expect(@user).to_not be_valid 
    end

    it "can have only 10 chars" do
      @user.ssn = "12345678901"
      expect(@user).to_not be_valid 
    end
  end
  

  describe "custom name method" do
    it "will have full_name method that combines first and last name" do
      expect(@user.full_name).to eq("UMAIR, AHMED")  
    end
  end
  
  describe "relationship b/w user and hand" do
    it "will make an admin and have its own selected employees" do
      employee1 = FactoryGirl.create(:user)
      employee2 = FactoryGirl.create(:user)
      admin = FactoryGirl.create(:admin_user)
      
      Hand.create(user_id: admin.id, hand_id: employee1.id)
      Hand.create(user_id: admin.id, hand_id: employee2.id)

      expect(admin.hands.count).to eq(2)  
    end
    
    
  end
  
  

end
