FactoryBot.define do
  factory :customer do

    transient do
      upcase {false}
      quantity_order {3}
    end

    name {Faker::Name.name}
    email {Faker::Internet.email}
    address {Faker:: Address.street_address}

    trait :male do
      gender {"M"}
    end

    trait :female do
      gender {"F"}
    end

    trait :vip do
      vip {true}
      days_to_pay {30}
    end

    trait :default
    vip {false}
    days_to_pay {10}

    trait :with_orders do
      after(:create) do |customer, evaluator|
        create_list(:order, evaluator.quantity_order, customer: customer)
      end
    end

    factory :customer_male, traits: [:male]
    factory :customer_female, traits: [:female]
    factory :customer_vip, traits: [:vip]
    factory :customer_default, traits: [:default]
    factory :customer_male_vip, traits: [:male, :vip]
    factory :customer_male_default, traits: [:male, :default]
    factory :customer_female_vip, traits: [:female, :vip]
    factory :customer_female_default, traits: [:female, :default]

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcase
    end
  end
end