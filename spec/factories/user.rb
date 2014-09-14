FactoryGirl.define do
  factory :user do
    name "Dummy User"
    sequence(:email) { |t| "lorem-#{t}@example.com" }
    password "12312312"
  end
end
