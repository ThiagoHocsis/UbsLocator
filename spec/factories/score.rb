FactoryBot.define do
  factory :score do
    size {1}
    adaptation_for_seniors{2}
    medical_equipament{3}
    medicine {2}
    association :health_unit_id, factory: :health_unit
  end
end