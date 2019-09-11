
class GeocodeScraperService

  def self.start(total_distance)
    @base_url = "http://impact.brighterplanet.com/flights?distance_estimate=#{total_distance}"

    html_file = open(@base_url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search("#committee_carbon > p.report").text.split(":").last.strip
  end

https://www.mapdevelopers.com/geocode_tool.php?address=gare%20de%20montparnasse

end
