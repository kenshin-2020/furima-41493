FactoryBot.define do
  factory :user do
    nickname {Faker::Name.first_name}
    email {Faker::Internet.email}
    password {"#{Faker::Alphanumeric.alphanumeric(number: 4)}a1"}
    password_confirmation {password}
    last_name  {['山田', 'さとう', 'スズキ'].sample}
    first_name  {['太郎', 'かな', 'コウ' ].sample}
    last_name_reading  { 'ヤマダ' }
    first_name_reading  { 'タロウ' }
    birth_date  {Faker::Date.birthday}
  end
end