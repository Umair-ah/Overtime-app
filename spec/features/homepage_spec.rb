require "rails_helper"

describe "homepage" do
    it "can be approved by an admin at admin's Home/Root page" do
        post = FactoryGirl.create(:post)
        admin_user = FactoryGirl.create(:admin_user)
        login_as(admin_user, scope: :user)

        visit root_path

        click_on("approve#{post.id}")
        expect(post.reload.status).to eq("approved")  
    end
    
    
end
