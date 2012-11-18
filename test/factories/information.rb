# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :information do
    demand "MyText"
    answer "MyText"
  end
end
