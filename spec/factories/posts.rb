FactoryGirl.define do
    factory :post do
        date Date.today
        rationale "Something Rationale"
    end

    factory :second_post, class: "Post" do
        date Date.yesterday
        rationale "Second rationale"
    end

end