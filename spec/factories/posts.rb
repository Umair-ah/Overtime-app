FactoryGirl.define do
    factory :post do
        date Date.today
        rationale "Something Rationale"
        user
    end

    factory :second_post, class: "Post" do
        date Date.yesterday
        rationale "Second rationale"
        user
    end

end