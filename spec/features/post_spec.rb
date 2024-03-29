require 'rails_helper'

describe "navigate" do
    let(:user) { FactoryGirl.create(:user) }
    let(:post) do
       Post.create(date: Date.today, rationale: "Rationale", user_id: user.id, overtime_request: 1.5) 
    end

    before do
        login_as(user, scope: :user)
    end

    describe "delete" do
        it "can delete a post" do
            logout(:user)
            delete_user = FactoryGirl.create(:user)
            login_as(delete_user, scope: :user)
            post_to_delete = Post.create(date: Date.today, rationale: "smthg0", user_id: delete_user.id, overtime_request: 1.5)
            visit posts_path

            click_button("delete_#{post_to_delete.id}_from_index")
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
            visit posts_path
            expect(page).to have_content(/Something|Rationale/)  
        end

        it "has a scope so that only post creators will be able to see posts" do
            other_user = User.create(first_name: "other", last_name:"user", email:"other@test.com", password:"other123", password_confirmation:"other123")
            post_from_other_user = Post.create(date:Date.today, rationale:"this should be hidden", user_id: other_user.id, overtime_request: 1.5)

            visit posts_path

            expect(page).to_not have_content(/this should be hidden/)  
            
        end
        
        
    end
    
    describe "new" do
        it "can create a new post" do
            emp = Employee.create(first_name: "emp", last_name:"user", email:"emp@test.com", password:"other123", password_confirmation:"other123")
            login_as(emp, scope: :user)
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
            fill_in "post[overtime_request]",	with: 2.3 
    
            expect { click_on "Save" }.to change(Post,:count ).by(1) 
            
        end
    
        it "will have a user associated with it" do
            fill_in "post[date]",	with: Date.today
            fill_in "post[rationale]",	with: "user association" 
            fill_in "post[overtime_request]",	with: 2.3 

            click_on "Save"
            expect(User.last.posts.last.rationale).to eq("user association")
            
        end
    end

    describe "edit" do

        it "can be edited" do
            visit edit_post_path(post)
            fill_in "post[date]",	with: Date.today 
            fill_in "post[rationale]",	with: "edited rationale"
            click_on "Save"
            expect(page).to have_content("edited rationale")   
        end 

        it "cannot be edited by non authorized user" do
            logout(:user)
            non_authorized_user = FactoryGirl.create(:non_authorized_user)
            login_as(non_authorized_user, scope: :user)

            visit edit_post_path(post)

            expect(current_path).to eq(root_path)  
        end

        
        
    end
    
    
end


