@user = User.create(email:"test@test.com", password:"test123", password_confirmation:"test123", first_name:"Umair", last_name:"Ahmed")
puts "1 User created"

100.times do |post|
    Post.create(date: Date.today, rationale: "#{post}rationale content", user_id: @user.id)
end

puts "100 posts have been created"