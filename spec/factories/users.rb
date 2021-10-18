FactoryBot.define do
factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {'abc123'}
    password_confirmation {'abc123'}
    family_name {'ひらがなカタカナ漢字'}
    first_name {'ひらがなカタカナ漢字'}
    family_name_kana {'カタカナ'}
    first_name_kana {'カタカナ'}
    birthday { Faker::Date.birthday}
  end
end  