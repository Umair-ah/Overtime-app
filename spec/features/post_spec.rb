require 'rails_helper'
describe "creation" do
    it "has a form that can be reached" do
        visit new_post_path
        expect(page.status_code).to eq(200)  
    end
    
    
end
