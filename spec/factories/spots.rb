FactoryGirl.define do
  factory :spot do
    sequence(:name) { |n| "名前_#{n-1}"}
    sequence(:en_name) { |n| "name_#{n-1}"}
    status "MyString"
    category "MyString"
    place "MyString"
    postalcode "MyString"
    sequence(:address) { |n| "住所_#{n-1}"}
    sequence(:en_address) { |n| "address_#{n-1}"}
    phone "MyString"
    time "MyString"
    ssid "MyString"
    limit "MyString"
    procedure "MyString"
    language "MyString"
    url "MyString"
    sequence(:latitude) { |n| 35 + (10 ** -n)}
    sequence(:longitude) { |n| 140 + (10 ** -n)}
    placecode 1
  end
end
