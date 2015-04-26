require "test_helper"
require "models/user"

describe "User" do
  include Rack::Test::Methods

  def app
    API::App
  end

  describe "signing up" do 
    before do
      post "/users", user: {
        handler: "joey",
        name: "joey sandine",
        password: "holler"
      }
    end
  
    it "creates a user" do
      last_response.status.must_equal 201 #created
    end

    it "shows the handler" do 
      last_response.body.must_include "joey"
    end

    it "shows the name" do 
      last_response.body.must_include "joey sandine"
    end
  end
end