FactoryBot.define do
  factory :geocode do
    lat {-21.2548649311059}
    long {-44.9909448623644}
    association :health_unit_id, factory: :health_unit
  end
end