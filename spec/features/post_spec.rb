require 'rails_helper'

describe "navigate" do
    before do
        @user = FactoryGirl.create(:user)
        login_as(@user, scope: :user)
    end

    describe "delete" do
        it "can delete a post" do
            @post = FactoryGirl.create(:post)
            visit posts_path

            click_button("delete_#{@post.id}_from_index")
            expect(page.status_code).to eq(200)  
            
        end
        
        
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
            post1 = FactoryGirl.create(:post)
            post2 = FactoryGirl.create(:second_post)
            visit posts_path
            expect(page).to have_content(/Something|Second/)  
        end
        
    end
    
    describe "new" do
        it "can create a new post" do
            visit root_path
            click_link("new_post_link")
            expect(page.status_code).to eq(200)  
        end
    end
    
    
    describe "creation" do
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

    describe "edit" do
        before do
            @post = FactoryGirl.create(:post)
        end

        it "can reach the edit page" do
            visit posts_path
            click_link("edit_#{@post.id}")
            expect(page.status_code).to eq(200)  
        end

        it "can be edited" do
            visit edit_post_path(@post)
            fill_in "post[date]",	with: Date.today 
            fill_in "post[rationale]",	with: "edited rationale"
            click_on "Save"
            expect(page).to have_content("edited rationale")   
        end 
    end
    
    
end


