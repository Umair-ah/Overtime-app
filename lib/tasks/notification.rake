namespace :notification do
  desc "Sends SMS Notification to employee asking them to log if they had overtime or not"
  task sms: :environment do
    # 1. Schedule to run at Sunday 5pm
    # 2. Iterate over all Employees
    # 3. Skin AdminUsers
    # 4. Send a message that has instruction and a link to log time
  end

end
