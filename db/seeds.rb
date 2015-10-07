Location.delete_all
Country.delete_all
Region.delete_all

regions = [
  'Europe', 'Africa', 'North America', 'Australasia', 'Central America',
  'South America', 'Caribbean', 'Middle East', 'Asia', 'Pacific Ocean',
  'Indian Ocean', 'Indonesia'
]

regions.each do |region|
  Region.create(name: region)
end

region = Region.find_by(name: 'Europe')

countries = {
  'Azores' => 67, 'Baltic-Sea' => 104, 'Bulgaria-Romania' => 101,
  'Canary-Islands' => 5, 'France' => 2, 'Germany-Denmark' => 10,
  'Greece' => 98, 'Iceland' => 73, 'Italy' => 89, 'Netherlands-Belgium' => 80,
  'Norway' => 52, 'Russia' => 96, 'Spain-Portugal' => 8, 'Sweden' => 103,
  'Turkey' => 105, 'UK-Ireland' => 1
}

countries.each do |country, id|
  new_country = Country.create(region: region, name: country)
  page = Nokogiri::HTML(open("http://magicseaweed.com/#{country}-Surf-Forecast/#{id}/"))
  data = page.css('.msw-map')[0].attr('data-collection')
  spots = JSON.parse(data)
  spots.each do |spot|
    location = Location.new(
      name: spot['name'],
      country: new_country,
      msw_id: spot['_id'],
      description: spot['description'],
      lat: spot['lat'],
      lon: spot['lon'],
      msw_url: spot['url']
    )
    if location.valid?
      location.save
    end
  end
end

region = Region.find_by(name: 'Africa')

countries = {
  'Central-Africa' => 86, 'Equatorial-Guinea' => 93,
  'Ghana-The-Ivory-Coast' => 60, 'Morocco' => 12,
  'Mozambique-Madagascar' => 57, 'South-Africa' => 3, 'West-Africa' => 69,
  'Western-Sahara' => 85
}

countries.each do |country, id|
  new_country = Country.create(region: region, name: country)
  page = Nokogiri::HTML(open("http://magicseaweed.com/#{country}-Surf-Forecast/#{id}/"))
  data = page.css('.msw-map')[0].attr('data-collection')
  spots = JSON.parse(data)
  spots.each do |spot|
    location = Location.new(
      name: spot['name'],
      country: new_country,
      msw_id: spot['_id'],
      description: spot['description'],
      lat: spot['lat'],
      lon: spot['lon'],
      msw_url: spot['url']
    )
    if location.valid?
      location.save
    end
  end
end

region = Region.find_by(name: 'North America')

countries = {
  'Alaska' => 82, 'Atlantic-States' => 23, 'California-Central' => 83,
  'California-North' => 16, 'California-South' => 17, 'Canada-West' => 50,
  'Florida' => 20, 'Great-Lakes' => 81, 'Gulf-Coast' => 9, 'New-England' => 21,
  'New-Jersey-New-York' => 22, 'North-Carolina' => 24, 'Nova-Scotia' => 26,
  'Oregon' => 15, 'South-Carolina-Georgia' => 25, 'Washington' => 14
}

countries.each do |country, id|
  new_country = Country.create(region: region, name: country)
  page = Nokogiri::HTML(open("http://magicseaweed.com/#{country}-Surf-Forecast/#{id}/"))
  data = page.css('.msw-map')[0].attr('data-collection')
  spots = JSON.parse(data)
  spots.each do |spot|
    location = Location.new(
      name: spot['name'],
      country: new_country,
      msw_id: spot['_id'],
      description: spot['description'],
      lat: spot['lat'],
      lon: spot['lon'],
      msw_url: spot['url']
    )
    if location.valid?
      location.save
    end
  end
end

region = Region.find_by(name: 'Australasia')

countries = {
  'New-South-Wales' => 47, 'New-Zealand' => 4, 'North-West-Australia' => 77,
  'Queensland' => 48, 'South-Australia' => 45, 'South-West-Australia' => 44,
  'Tasmania' => 49, 'Victoria' => 46
}

countries.each do |country, id|
  new_country = Country.create(region: region, name: country)
  page = Nokogiri::HTML(open("http://magicseaweed.com/#{country}-Surf-Forecast/#{id}/"))
  data = page.css('.msw-map')[0].attr('data-collection')
  spots = JSON.parse(data)
  spots.each do |spot|
    location = Location.new(
      name: spot['name'],
      country: new_country,
      msw_id: spot['_id'],
      description: spot['description'],
      lat: spot['lat'],
      lon: spot['lon'],
      msw_url: spot['url']
    )
    if location.valid?
      location.save
    end
  end
end

region = Region.find_by(name: 'Central America')

countries = {
  'Central-America-North' => 28, 'Central-America-South' => 29,
  'Mexico-Baja' => 18, 'Mexico-Pacific' => 19
}

countries.each do |country, id|
  new_country = Country.create(region: region, name: country)
  page = Nokogiri::HTML(open("http://magicseaweed.com/#{country}-Surf-Forecast/#{id}/"))
  data = page.css('.msw-map')[0].attr('data-collection')
  spots = JSON.parse(data)
  spots.each do |spot|
    location = Location.new(
      name: spot['name'],
      country: new_country,
      msw_id: spot['_id'],
      description: spot['description'],
      lat: spot['lat'],
      lon: spot['lon'],
      msw_url: spot['url']
    )
    if location.valid?
      location.save
    end
  end
end

region = Region.find_by(name: 'South America')

countries = {
  'Antarctic-Peninsula' => 94, 'Argentina' => 35, 'Brazil-East' => 37,
  'Brazil-Northeast' => 38, 'Brazil-South' => 36, 'Chile-North' => 33,
  'Chile-South' => 34, 'Columbia' => 87, 'Ecuador' => 30, 'Peru-North' => 31,
  'Peru-South' => 32, 'Uraguay' => 92
}

countries.each do |country, id|
  new_country = Country.create(region: region, name: country)
  page = Nokogiri::HTML(open("http://magicseaweed.com/#{country}-Surf-Forecast/#{id}/"))
  data = page.css('.msw-map')[0].attr('data-collection')
  spots = JSON.parse(data)
  spots.each do |spot|
    location = Location.new(
      name: spot['name'],
      country: new_country,
      msw_id: spot['_id'],
      description: spot['description'],
      lat: spot['lat'],
      lon: spot['lon'],
      msw_url: spot['url']
    )
    if location.valid?
      location.save
    end
  end
end

region = Region.find_by(name: 'Caribbean')

countries = {
  'Bermuda' => 70, 'Central-Caribbean' => 42, 'Leeward-Islands' => 41,
  'Venezuela-Trinidadad-Tobago' => 43, 'Windward-Islands' => 40
}

countries.each do |country, id|
  new_country = Country.create(region: region, name: country)
  page = Nokogiri::HTML(open("http://magicseaweed.com/#{country}-Surf-Forecast/#{id}/"))
  data = page.css('.msw-map')[0].attr('data-collection')
  spots = JSON.parse(data)
  spots.each do |spot|
    location = Location.new(
      name: spot['name'],
      country: new_country,
      msw_id: spot['_id'],
      description: spot['description'],
      lat: spot['lat'],
      lon: spot['lon'],
      msw_url: spot['url']
    )
    if location.valid?
      location.save
    end
  end
end

region = Region.find_by(name: 'Middle East')

countries = {
  'Isreal' => 90, 'Lebanon' => 97, 'Oman' => 53, 'Persian-Gulf' => 100
}

countries.each do |country, id|
  new_country = Country.create(region: region, name: country)
  page = Nokogiri::HTML(open("http://magicseaweed.com/#{country}-Surf-Forecast/#{id}/"))
  data = page.css('.msw-map')[0].attr('data-collection')
  spots = JSON.parse(data)
  spots.each do |spot|
    location = Location.new(
      name: spot['name'],
      country: new_country,
      msw_id: spot['_id'],
      description: spot['description'],
      lat: spot['lat'],
      lon: spot['lon'],
      msw_url: spot['url']
    )
    if location.valid?
      location.save
    end
  end
end

region = Region.find_by(name: 'Asia')

countries = {
  'China' => 78, 'Japan' => 61, 'Korea' => 106, 'Phillippines' => 66,
  'South-East-Asia' => 71, 'Taiwan' => 88
}

countries.each do |country, id|
  new_country = Country.create(region: region, name: country)
  page = Nokogiri::HTML(open("http://magicseaweed.com/#{country}-Surf-Forecast/#{id}/"))
  data = page.css('.msw-map')[0].attr('data-collection')
  spots = JSON.parse(data)
  spots.each do |spot|
    location = Location.new(
      name: spot['name'],
      country: new_country,
      msw_id: spot['_id'],
      description: spot['description'],
      lat: spot['lat'],
      lon: spot['lon'],
      msw_url: spot['url']
    )
    if location.valid?
      location.save
    end
  end
end

region = Region.find_by(name: 'Pacific Ocean')

countries = {
  'Cook-Islands' => 102, 'Fiji-Samoa-Tonga' => 76, 'French-Polynesia' => 62,
  'Hawaii' => 51, 'Micronesia-Carolines' => 68
}

countries.each do |country, id|
  new_country = Country.create(region: region, name: country)
  page = Nokogiri::HTML(open("http://magicseaweed.com/#{country}-Surf-Forecast/#{id}/"))
  data = page.css('.msw-map')[0].attr('data-collection')
  spots = JSON.parse(data)
  spots.each do |spot|
    location = Location.new(
      name: spot['name'],
      country: new_country,
      msw_id: spot['_id'],
      description: spot['description'],
      lat: spot['lat'],
      lon: spot['lon'],
      msw_url: spot['url']
    )
    if location.valid?
      location.save
    end
  end
end

region = Region.find_by(name: 'Indian Ocean')

countries = {
  'Bangladesh' => 99, 'India' => 79, 'Maldives' => 56,
  'Mauritius-Reunion' => 58, 'Seychelles' => 91, 'Sri-Lanka' => 54
}

countries.each do |country, id|
  new_country = Country.create(region: region, name: country)
  page = Nokogiri::HTML(open("http://magicseaweed.com/#{country}-Surf-Forecast/#{id}/"))
  data = page.css('.msw-map')[0].attr('data-collection')
  spots = JSON.parse(data)
  spots.each do |spot|
    location = Location.new(
      name: spot['name'],
      country: new_country,
      msw_id: spot['_id'],
      description: spot['description'],
      lat: spot['lat'],
      lon: spot['lon'],
      msw_url: spot['url']
    )
    if location.valid?
      location.save
    end
  end
end

region = Region.find_by(name: 'Indonesia')

countries = {
  'Bali-Lombok' => 55, 'Java' => 64, 'Maluku-Islands' => 84,
  'Nusa-Tenggara' => 65, 'Sumatra-Mentawais' => 63
}

countries.each do |country, id|
  new_country = Country.create(region: region, name: country)
  page = Nokogiri::HTML(open("http://magicseaweed.com/#{country}-Surf-Forecast/#{id}/"))
  data = page.css('.msw-map')[0].attr('data-collection')
  spots = JSON.parse(data)
  spots.each do |spot|
    location = Location.new(
      name: spot['name'],
      country: new_country,
      msw_id: spot['_id'],
      description: spot['description'],
      lat: spot['lat'],
      lon: spot['lon'],
      msw_url: spot['url']
    )
    if location.valid?
      location.save
    end
  end
end
