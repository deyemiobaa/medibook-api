FactoryBot.define do
  factory :doctor do
    name { Faker::Name.name }
    specialization { Faker::Job.field }
    picture { 'mydemopic.png' }
    available_times { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now + 1) }
    hourly_rate { Faker::Number.between(from: 10, to: 100) }
  end

  factory :user do
    username { Faker::Name.name }
    password { 'password' }
    password_confirmation { 'password' }
    role { 'admin' }
  end

  factory :appointment do
    date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now + 1) }
    duration { Faker::Number.between(from: 1, to: 10) }
    doctor
    user
  end
end
