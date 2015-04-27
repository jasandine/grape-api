require "test_helper"
require "env"
require "apps/v2public"
require "uploaders/asset"
require "models/asset"
require "pry"

describe "Downloading the file as another user" do 
  include Rack::Test::Methods

  def app
    API::AppV2Public
  end

  let(:id) { 103 }
  let(:path) { "/v2/files/#{id}/download" }

  it "downloads a file as another user" do
    get path, receiver: "me@me.com"

    last_response.status.must_equal 302
  end

  it "fails to download the file as the incorrect user" do
    get path, receiver: "you@you.com"

    last_response.status.must_equal 403 #forbidden
  end
end
