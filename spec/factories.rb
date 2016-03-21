FactoryGirl.define do
  factory :user do
    email "hsuser@leighhack.com"
    uid "0123456"
    role "user"

    trait :admin do
      role 'admin'
    end
  end
end
