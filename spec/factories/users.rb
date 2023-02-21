FactoryGirl.define do
    sequence :email do |n|
        "test#{n}@test.com"
    end

    factory :user do
        first_name "Umair"
        last_name "Ahmed"
        email { generate :email }
        password "test123"
        password_confirmation "test123"
    end

    factory :admin_user, class: "AdminUser" do
        first_name "Admin"
        last_name "User"
        email { generate :email }
        password "admin123"
        password_confirmation "admin123"
    end

end