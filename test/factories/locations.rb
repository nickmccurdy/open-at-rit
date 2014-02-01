# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    name 'The Corner Store'
    hours [[(8.hour)...(2.hour)], [(10.5.hour)...(24.hour)]]
  end
end
