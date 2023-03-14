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
    Post.create(date: Date.today, rationale: "#{post}rationale content Lorem Ipsum is simply 
        dummy text of the printing and typesetting industry. Lorem Ipsum has been the 
        industry's standard dummy text ever since the 1500s, when an unknown printer 
        took a galley of type and scrambled it to make a type specimen book. It has
        survived not only five centuries, but also the leap into electronic typesetting,
        remaining essentially unchanged. It was popularised in the 1960s with the
        release of Letraset sheets containing Lorem Ipsum passages, and more recently
        with desktop publishing software like Aldus PageMaker including versions of 
        Lorem Ipsum.", overtime_request: 4.5, user_id: @user.id)
end

puts "100 posts have been created"

100.times do |audit_log|
    AuditLog.create(user_id: @user.id, status: 0, start_date: (Date.today - 6.days))
end

puts "100 audit logs have been created"