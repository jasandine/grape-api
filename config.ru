$:.unshift File.expand_path "..", __FILE__
require "lib/env"

require "lib/uploaders/asset"
require "lib/models/asset"
require "lib/app"

run API::App
