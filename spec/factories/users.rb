FactoryBot.define do
  factory :user do
    nickname {Faker::Name.first_name}
    email {Faker::Internet.email}
    password {"#{Faker::Alphanumeric.alphanumeric(number: 4)}a1"}
    password_confirmation {password}
    last_name  {Faker::Name.last_name}
    first_name  {Faker::Name.first_name}
    last_name_reading  { 'ヤマダ' }
    first_name_reading  { 'タロウ' }
    birth_date  {Faker::Date.birthday}
  end
end