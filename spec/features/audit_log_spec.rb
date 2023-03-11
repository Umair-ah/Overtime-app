require 'rails_helper'


describe "audit log" do
    before do
        admin_user = FactoryGirl.create(:admin_user)
        login_as(admin_user, scope: :user)
        FactoryGirl.create(:audit_log)
    end

    describe "index page" do
        it "can be reached" do
            visit audit_logs_path
            expect(page.status_code).to eq(200)              
        end

        it "has contents" do
            visit audit_logs_path
            expect(page).to have_content(/UMAIR, AHMED/) 
            
        end
        
        
        
    end
    
    
end
