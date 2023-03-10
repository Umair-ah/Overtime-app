@user = User.create(email:"test@user.com",
                    password:"user123",
                    password_confirmation:"user123",
                    first_name:"Umair",
                    last_name:"Ahmed",
                    phone:"7795930967")
puts "1 User created"

AdminUser.create(email:"test@admin.com",
                password:"admin123",
                password_confirmation:"admin123",
                first_name:"Uzair",
                last_name:"Ahmed",
                phone:"7795930967")
puts "1 Admin created"

100.times do |post|
    Post.create(date: Date.today, rationale: "#{post}rationale content", overtime_request: 4.5, user_id: @user.id)
end

puts "100 posts have been created"

100.times do |audit_log|
    AuditLog.create(user_id: User.last.id, status: 0, start_date: (Date.today - 6.days))
end

puts "100 audit logs have been created"