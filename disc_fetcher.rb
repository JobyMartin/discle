
require 'net/http'
require 'json'
require 'uri'

class DiscFetcher
  def initialize
    @api_url = 'https://discit-api.fly.dev/disc'
    @output_file = 'discs.json'
    @discs = nil
  end
  # Method to fetch disc data
  def fetch_discs
    uri = URI.parse(@api_url)
    response = Net::HTTP.get_response(uri)

    if response.is_a?(Net::HTTPSuccess)
      @discs = JSON.parse(response.body)
    else
      puts "Error fetching data: #{response.message}"
      @discs = []
    end
    save_to_json
  end

  # Method to extract relevant data and save to a JSON file
  def save_to_json
    filtered_discs = @discs.map do |disc|
      {
        name: disc['name'],
        brand: disc['brand'],
        speed: disc['speed'],
        glide: disc['glide'],
        turn: disc['turn'],
        fade: disc['fade']
      }
    end

    File.open(@output_file, 'w') do |file|
      file.write(JSON.pretty_generate(filtered_discs))
    end
    puts "Data saved to #{@output_file}"
  end
end

disc = DiscFetcher.new
disc.fetch_discs