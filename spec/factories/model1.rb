FactoryGirl.define do
  factory :model1, class: RestApiTemplate::Model::Model1 do
    name { Faker::Address.city }
    association :model2
  end
end
