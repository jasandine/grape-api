require "test_helper"
require "uploaders/asset"
require "models/asset"
require "apps/v2"
require "pry"

describe "Upload a file" do 

  include Rack::Test::Methods

  def app
    API::AppV2
  end
  
  before do 
    file_path = fixture_path "zip.zip"

    authorize "joey", "holla"

    post "/v2/files", {
      file: {
        title: "My First Zip File",
        file: Rack::Test::UploadedFile.new(file_path, "application/zip", true)
      }
    }
  end

  it "uploads a file" do
    last_response.status.must_equal 201
  end

  it "retrieves the content for the new file" do 
    last_response.body.must_include "My First Zip File"
  end

  it "retrieves the actual filename" do
    last_response.body.must_include "zip.zip"
  end

  it "retrieves the full path of the file" do 
    last_response.body.must_include "public/uploads/assets"
  end

end
