require 'rails_helper'
RSpec.describe "HTTParty" do
  it "httparty" do
    response = HTTParty.get("https://jsonplaceholder.typicode.com/post/2")
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
  end
end