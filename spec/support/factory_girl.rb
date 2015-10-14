require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    sequence(:user_name) { |n| "Tony#{n}" }
  end

  factory :region do
    sequence(:name) { |n| "Europe#{n}" }
  end

  factory :country do
    sequence(:name) { |n| "Azores#{n}" }
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
    sequence(:title) { |n| "Wicked good #{n}" }
    user
    location
    country
    region
    date '10-12-2015'
    body 'yewwww'
  end

  factory :swell_data, class:Hash do
    data {
      { "timestamp" => 1444780800,
       "localTimestamp" => 1444780800,
       "issueTimestamp" => 1444780800,
       "fadedRating" => 0,
       "solidRating" => 2,
       "swell" =>
        { "minBreakingHeight" => 2,
         "absMinBreakingHeight" => 1.73,
         "maxBreakingHeight" => 3,
         "absMaxBreakingHeight" => 2.7,
         "unit" => "ft",
         "components" =>
          { "combined" => { "height" => 2.5, "period" => 18, "direction" => 102.88, "compassDirection" => "WNW" },
           "primary" => { "height" => 1.3, "period" => 17, "direction" => 105.32, "compassDirection" => "WNW" },
           "secondary" => { "height" => 1.1, "period" => 10, "direction" => 94.39, "compassDirection" => "W" },
           "tertiary" => { "height" => 1.6, "period" => 5, "direction" => 204.06, "compassDirection" => "NNE" }}},
       "wind" => { "speed" => 9, "direction" => 247, "compassDirection" => "ENE", "chill" => 46, "gusts" => 12, "unit" => "mph" },
       "condition" => { "pressure" => 1027, "temperature" => 53, "weather" => 10, "unitPressure" => "mb", "unit" => "f" },
       "charts" =>
        { "swell" => "http://hist-1.msw.ms/wave/750/1-1444780800-1.gif",
         "period" => "http://hist-1.msw.ms/wave/750/1-1444780800-2.gif",
         "wind" => "http://hist-1.msw.ms/gfs/750/1-1444780800-4.gif",
         "pressure" => "http://hist-1.msw.ms/gfs/750/1-1444780800-3.gif",
         "sst" => "http://hist-1.msw.ms/sst/750/1-1444780800-10.gif" }}
    }
    initialize_with { attributes }
  end

end
