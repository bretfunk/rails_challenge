class EfinUpdateJob < ApplicationJob
  queue_as :default

  def perform(data)
    test_data = {
      "household": 1,
      "income":  20000
    }
    OddballService.post_request(test_data)
  end
end
