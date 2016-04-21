FactoryGirl.define do
  factory :user do
    email "hsuser@leighhack.com"
    uid "0123456"
    role "user"
    password "11111111"
    password_confirmation "11111111"

    trait :admin do
      role 'admin'
    end
  end
end
