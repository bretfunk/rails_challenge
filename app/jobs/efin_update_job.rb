class EfinUpdateJob < ApplicationJob
  queue_as :default

  def perform(data)
    #byebug
    test_data = {
        "household": 1,
          "income":  20000
    }

    conn = Faraday.new(url: "http://efin.oddball.io")
    byebug
    conn.post "/", test_data
  end
end
