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
        phone "1234567890"
        ssn 1234
        company "ABC comp"
    end

    factory :admin_user, class: "AdminUser" do
        first_name "Admin"
        last_name "User"
        email { generate :email }
        password "admin123"
        password_confirmation "admin123"
        phone "1234567890"
        ssn 1234
        company "ABC comp"
    end

    factory :non_authorized_user, class: "User" do
        first_name "Non"
        last_name "Authorized"
        email { generate :email }
        password "non123"
        password_confirmation "non123"
        phone "1234567890"
        ssn 1234
        company "ABC comp"
    end

end