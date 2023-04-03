FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email{Faker::Internet.free_email}
    password{Faker::Internet.password(min_length:6)}
    password_confirmation{password}
    firstname             {'山田'}
    lastname              {'花子'}
    firstnameruby         {'ヤマダ'}
    lastnameruby          {'ハナコ'}
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end  