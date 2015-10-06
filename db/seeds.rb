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

countries = [
  'Azores', 'Baltic Sea', 'Bulgaria + Romania', 'Canary Islands', 'France',
  'Germany + Denmark', 'Greece', 'Iceland', 'Italy', 'Netherlands + Belgium',
  'Norway', 'Russia', 'Spain + Portugal', 'Sweden', 'Turkey', 'UK + Ireland'
]

countries.each do |country|
  Country.create(region: region, name: country)
end

region = Region.find_by(name: 'Africa')

countries = [
  'Central Africa', 'Equatorial Guinea', 'Ghana + The Ivory Coast',
  'Morocco', 'Mozambique + Madagascar', 'South Africa', 'West Africa',
  'Western Sahara'
]

countries.each do |country|
  Country.create(region: region, name: country)
end

region = Region.find_by(name: 'North America')

countries = [
  'Alaska', 'Atlantic States', 'California, Central', 'California, North',
  'California, South', 'Canada, West', 'Florida', 'Great Lakes', 'Gulf Coast',
  'New England', 'New Jersey + New York', 'North Carolina', 'Nova Scotia',
  'Oregon'
]

countries.each do |country|
  Country.create(region: region, name: country)
end

region = Region.find_by(name: 'Australasia')

countries = [
  'New South Wales', 'New Zealand', 'North West Australia', 'Queensland',
  'South Australasia', 'South West Australasia', 'Tasmania', 'Victoria'
]

countries.each do |country|
  Country.create(region: region, name: country)
end

region = Region.find_by(name: 'Central America')

countries = [
  'Central America North', 'Central America South', 'Mexico, Baja',
  'Mexico, Pacific'
]

countries.each do |country|
  Country.create(region: region, name: country)
end

region = Region.find_by(name: 'South America')

countries = [
  'Antarctic Peninsula', 'Argentina', 'Brazil - East', 'Brazil - Northeast',
  'Brazil - South', 'Chile - North', 'Chile - South', 'Columbia', 'Ecuador',
  'Peru - North', 'Peru - South', 'Uraguay'
]

countries.each do |country|
  Country.create(region: region, name: country)
end

region = Region.find_by(name: 'Caribbean')

countries = [
  'Bermuda', 'Central Caribbean', 'Leeward Islands',
  'Venezuela, Trinidadad + Tobago', 'Windward Islands'
]

countries.each do |country|
  Country.create(region: region, name: country)
end

region = Region.find_by(name: 'Middle East')

countries = [
  'Isreal', 'Lebanon', 'Oman', 'Persian Gulf'
]

countries.each do |country|
  Country.create(region: region, name: country)
end

region = Region.find_by(name: 'Asia')

countries = [
  'China', 'Japan', 'Korea', 'Phillippines', 'South East Asia', 'Taiwan'
]

countries.each do |country|
  Country.create(region: region, name: country)
end

region = Region.find_by(name: 'Pacific Ocean')

countries = [
  'Cook Islands', 'Fiji, Samoa + Tonga', 'French Polynesia', 'Hawaii',
  'Micronesia (Carolines)'
]

countries.each do |country|
  Country.create(region: region, name: country)
end

region = Region.find_by(name: 'Indonesia')

countries = [
  'Bali + Lombok', 'Java', 'Maluku Islands', 'Nusa Tenggara',
  'Sumatra + Mentawais'
]

countries.each do |country|
  Country.create(region: region, name: country)
end
