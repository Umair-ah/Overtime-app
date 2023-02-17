require 'rails_helper'

describe "navigate" do
    before do
        user = User.create(email:"test@test.com", password:"test123", password_confirmation:"test123", first_name:"Umair", last_name:"Ahmed")
        login_as(user, scope: :user)
    end

    describe "index" do
        
        it "will reach the index page of posts" do
            visit posts_path
            expect(page.status_code).to eq(200)  
        end

        it "will have a title of Posts." do
            visit posts_path
            expect(page).to have_content(/Posts./)            
        end

        it "will have lists of posts" do
            post1 = Post.create(date: Date.today, rationale: "post1")
            post2 = Post.create(date: Date.today, rationale: "post2")
            visit posts_path
            expect(page).to have_content(/post1|post2/)  
        end
        
    end
    
    describe "create and new" do
        before do
            
            visit new_post_path
        end
    
        it "has a form that can be reached" do
            expect(page.status_code).to eq(200)  
        end
    
        it "can be created from new form page" do
            fill_in "post[date]",	with: Date.today
            fill_in "post[rationale]",	with: "something rationale" 
    
            click_on "Save"
            expect(page).to have_content("something rationale")
            
        end
    
        it "will have a user associated with it" do
            fill_in "post[date]",	with: Date.today
            fill_in "post[rationale]",	with: "user association" 
    
            click_on "Save"
            expect(User.last.posts.last.rationale).to eq("user association")
            
        end
        
    end
    
end


