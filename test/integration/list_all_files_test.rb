require "test_helper"
require "uploaders/asset"
require "models/asset"
require "app"
require "pry"

describe "Listing all files" do 
  include Rack::Test::Methods

  def app
    API::App
  end

  before do 
    get "/files"
  end

  it "provides a valid response" do
    last_response.status.must_equal 200
  end

  it "lists all files" do
    last_response.body.must_include "My First Zip File"
  end
end