require "test_helper"
require "env"
require "apps/v2public"
require "models/asset"
require "uploaders/asset"


describe "Retrieving a single file" do 
  include Rack::Test::Methods

  def app
    API::AppV2
  end

	it "retrieves a file" do 
		authorize "joey", "holler"
		get "/v2/files/100"

    last_response.body.must_include "My First Zip File"
  end

  it "complains about a bad id" do
  	skip
    authorize "joey", "holler" 
    get "/v2/files/zip.zip"

    last_response.status.must_equal 400
  end
end
