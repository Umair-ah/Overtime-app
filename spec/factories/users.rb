FactoryGirl.define do
    factory :user do
        first_name "Umair"
        last_name "Ahmed"
        email "test@test.com"
        password "test123"
        password_confirmation "test123"
    end

    factory :admin_user, class: "AdminUser" do
        first_name "Admin"
        last_name "USer"
        email "admin@user.com"
        password "admin123"
        password_confirmation "admin123"
    end

end