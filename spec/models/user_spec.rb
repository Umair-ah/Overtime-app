require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.create(email:"test@test.com", password:"test123", password_confirmation:"test123", first_name:"Umair", last_name:"Ahmed")
  end

  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid        
    end

    it "cannot be created without first and last name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid      
    end
  end

  describe "custom name method" do
    it "will have full_name method that combines first and last name" do
      expect(@user.full_name).to eq("UMAIR, AHMED")  
    end
  end
  

end
