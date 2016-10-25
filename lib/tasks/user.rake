namespace :user do
  desc "Creates sample data for local development"
  task set_up_admin: :environment do
    AdminUser::User.create!(
      email: "admin@example.com",
      uid: "0123456",
      password: "11111111",
      password_confirmation: "11111111",
    )

    puts "Admin user created: u: admin@example.com, p: 11111111"
  end
end
