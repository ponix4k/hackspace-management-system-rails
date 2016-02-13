namespace :user do
  desc "Creates sample data for local development"
  task set_up_admin: :environment do
    User.create!(
      email: "admin@example.com",
      uid: "0123456",
      password: "11111111",
      password_confirmation: "11111111",
      role: "admin"
    )

    puts "Admin user created: u: admin@example.com, p: 11111111"
    puts "Start the server with rails s and log in a localhost:3000/admin"
  end
end
