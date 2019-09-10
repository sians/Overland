require 'open-uri'
require 'nokogiri'

total_duration = @routes[key]["legs"][0]["duration"]["text"]
url = "http://impact.brighterplanet.com/flights?distance_estimate=#{total_duration}"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.interpreted distance_estimate').each do |element|
  puts element.text.strip
  puts element.attribute('href').value
end
