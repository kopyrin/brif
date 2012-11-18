FactoryGirl.define do
  factory :project do
    name "project2"
    user_id 1
    autor "autor2"
    grave false
  end

  factory :user do
    name "kopyrin3"
    email "kopyrin3@mail.ru"
    password "753864291"
  end
end

