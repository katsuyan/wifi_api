FactoryGirl.define do
  factory :spot do
    name "MyString"
    en_name "MyString"
    status "MyString"
    category "MyString"
    place "MyString"
    postalcode "MyString"
    address "MyString"
    phone "MyString"
    time "MyString"
    ssid "MyString"
    limit "MyString"
    procedure "MyString"
    language "MyString"
    url "MyString"
    sequence(:longitude) { |n| 35 + (10 ** -n)}
    sequence(:latitude) { |n| 140 + (10 ** -n)}
    placecode 1
  end
end
