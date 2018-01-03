class OddballService
  attr_reader :conn, :data
  def initialize(data)
    @data = data
    @conn = Faraday.new(url: "http://efin.oddball.io") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

    def self.post_request(data)
      new(data).post_request
    end

    def post_request
      parse(@conn.post "/", data)
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
