require "test_helper"
require "uploaders/asset"
require "models/asset"
require "apps/v2"
require "pry"

describe "Download a file" do
  include Rack::Test::Methods

  def app
    API::AppV2
  end

  it "downloads a file" do
    authorize "joey", "holler"
    asset = Asset.last
    get "/v2/files/#{asset.id}/download"

    last_response.status.must_equal 302
  end 
end