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

    it "can be confirmed by an employee at employee's Home/Root page" do
        audit_log = FactoryGirl.create(:audit_log)
        user = FactoryGirl.create(:user)
        login_as(user, scope: :user)
        audit_log.update(user_id: user.id)

        visit root_path

        click_on("confirm_#{audit_log.id}")
        expect(audit_log.reload.status).to eq("confirmed")  
    end
    
    
    
end
