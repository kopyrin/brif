# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :matter do
    demand "MyText"
    answer "MyText"
    category "MyString"
    sybcategory "MyText"
    ordercategory 1
    project_id 1
  end
end
