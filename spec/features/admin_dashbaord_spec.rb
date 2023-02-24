require "rails_helper"

describe "admin dashbaord" do
    it "does not allow users to access without signing in" do
        visit admin_root_path
        expect(current_path).to eq(new_user_session_path)  
    end

    it "cannot be reached by a normal user" do
        user = FactoryGirl.create(:user)
        login_as(user, scope: :user)
        visit admin_root_path
        expect(current_path).to eq(root_path)  
    end
    
    
    
end

