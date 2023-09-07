require "json"
require "open-uri"
require "nokogiri"

Artwork.destroy_all

url = "https://collectionapi.metmuseum.org/public/collection/v1/search?hasImages=true&q=sunflowers"
info = URI.parse(url).read
search_hash = JSON.parse(info)
object_ids = search_hash["objectIDs"]
puts object_ids

object_ids.first(20).each do |object_id|
  url = "https://collectionapi.metmuseum.org/public/collection/v1/objects/#{object_id}"
  infos = URI.parse(url).read
  search = JSON.parse(infos)

if search != nil && search["primaryImage"] != ""
  artwork = Artwork.create(name: search["title"], artist: search["artistDisplayName"] , image: search["primaryImage"], cost_per_day: rand(10-10000), culture: search["Culture"], completion_date: search["artistEndDate"], medium: search["medium"] )
  puts "Created artwork #{artwork.id}"
end
end
