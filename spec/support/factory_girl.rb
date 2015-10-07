require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    sequence(:user_name) { |n| "Tony#{n}" }
  end

  factory :region do
    name 'Europe'
  end

  factory :country do
    name 'Azores'
    region
  end

  factory :location do
    name 'Agua de Alto'
    country
    msw_id 3842
    lat 37.7163
    lon -25.4736
    msw_url "/Agua-de-Alto-Surf-Report/3842/"
  end

  factory :entry do
    sequence(:title) { |n| "Wicked good #{n}"}
    user
    location_id 1
    country_id 1
    region_id 1
    date '10-12-2015'
  end

end
