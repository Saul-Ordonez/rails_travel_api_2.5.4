FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
  end

  factory(:review) do
    author {'Santa'}
    content {'Ho ho'}
  end
end
