require 'rails_helper'

describe "Oddball Service" do
  it "can make a post request to the Oddball api" do

    test_data = {
      "household": 1,
      "income":  20000
    }

    response = OddballService.post_request(test_data)

    expect(response).to be_success

    efin = JSON.parse(response.body)
    #I would normally test the response data here but since it isn't working I don't know the format to test
    expect(efin).to be(variable)
  end
end
