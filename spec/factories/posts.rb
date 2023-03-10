FactoryGirl.define do
    factory :post do
        date Date.today
        rationale "Something Rationale"
        overtime_request 2.5
        user
    end

    factory :second_post, class: "Post" do
        date Date.yesterday
        rationale "Second rationale"
        overtime_request 0.5
        user
    end

end