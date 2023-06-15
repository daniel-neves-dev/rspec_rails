FactoryBot.define do
  factory :customer do

    transient do
      upcase {false}
    end

    name {Faker::Name.name}
    email {Faker::Internet.email}

    factory :customer_vip do
      vip {true}
      days_to_pay {30}
    end

    factory :customer_default
    vip {false}
    days_to_pay {10}

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcase
    end
  end
end