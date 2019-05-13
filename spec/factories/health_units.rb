FactoryBot.define do
  factory :health_unit do
    name {'UBS Lavras'}
    address {Faker::Address.street_name}
    city {Faker::Address.city}
    phone {'35 - 99911-9210'}
  end
end