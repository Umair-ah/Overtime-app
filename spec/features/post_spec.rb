require 'rails_helper'

describe "navigate" do
    before do
        @user = FactoryGirl.create(:user)
        login_as(@user, scope: :user)
    end

    describe "delete" do
        it "can delete a post" do
            @post = FactoryGirl.create(:post)
            @post.update(user_id: @user.id)
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
            post1.update(user_id: @user.id)
            post2 = FactoryGirl.create(:second_post)
            post2.update(user_id: @user.id)
            visit posts_path
            expect(page).to have_content(/Something|Second/)  
        end

        it "has a scope so that only post creators will be able to see posts" do
            post1 = Post.create(date:Date.today, rationale:"smthg", user_id: @user.id)
            post2 = Post.create(date:Date.today, rationale:"smthg2", user_id: @user.id)

            other_user = User.create(first_name: "other", last_name:"user", email:"other@test.com", password:"other123", password_confirmation:"other123")
            post_from_other_user = Post.create(date:Date.today, rationale:"this should be hidden", user_id: other_user.id)

            visit posts_path

            expect(page).to_not have_content(/this should be hidden/)  
            
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
            logout(:user)
            @edit_user = User.create(first_name: "Umair", last_name: "Ahmed", email: "umair@ahmed.com", password: "umair123",
                 password_confirmation: "umair123")
            login_as(@edit_user, scope: :user)
            @edit_post = Post.create(date: Date.today, rationale: "smthg", user_id: @edit_user.id)
        end

        it "can be edited" do
            visit edit_post_path(@edit_post)
            fill_in "post[date]",	with: Date.today 
            fill_in "post[rationale]",	with: "edited rationale"
            click_on "Save"
            expect(page).to have_content("edited rationale")   
        end 

        it "cannot be edited by non authorized user" do
            logout(:user)
            non_authorized_user = FactoryGirl.create(:non_authorized_user)
            login_as(non_authorized_user, scope: :user)

            visit edit_post_path(@edit_post)

            expect(current_path).to eq(root_path)  
        end
        
    end
    
    
end


