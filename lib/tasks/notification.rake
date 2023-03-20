namespace :notification do
  desc "Sends SMS Notification to employee asking them to log if they had overtime or not"
  task sms: :environment do
    # 1. Schedule to run at Sunday 5pm
    # 2. Iterate over all Employees
    # 3. Skin AdminUsers
    # 4. Send a message that has instruction and a link to log time
  end

  desc "Sends Email Notification to admins for approve/decline overtime requests each day"
  task manager_email: :environment do
    # 1. Schedule to run at Sunday 5pm
    # 2. Iterate over all Employees
    # 3. Skin AdminUsers
    # 4. Send a message that has instruction and a link to log time
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_later
      end
    end
  end

end
