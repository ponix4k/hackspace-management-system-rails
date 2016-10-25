namespace :user do
  desc "Creates sample data for local development"
  task set_up_admin: :environment do
    AdminUser.create!(
      email: "admin@leighhack.org",
      password: "hspassword",
      password_confirmation: "hspassword"
    )

    puts "Admin user created: u: admin@leighhack, p: hspassword"
  end
end
