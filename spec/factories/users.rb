FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
    first_name            {"田中"}
    last_name             {"太郎"}
    first_kana_name       {"タナカ"}
    last_kana_name        {"タロウ"}
  end
end