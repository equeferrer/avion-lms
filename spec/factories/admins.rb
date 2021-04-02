FactoryBot.define do
  factory :admin do
    first_name { 'Admin' }
    last_name { 'Test' }
    email { 'admin@gmail.com' }
    password { '123456' }
  end
end
