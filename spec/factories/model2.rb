FactoryGirl.define do
  factory :model2, class: RestApiTemplate::Model::Model2 do
    name { Faker::Address.state }
  end
end
