$:.unshift File.expand_path "..", __FILE__
require "lib/env"

require "lib/uploaders/asset"
require "lib/models/asset"
require "lib/models/user"
require "lib/app"
require "lib/apps/v2"
require "lib/apps/v2public"
require "lib/apps/v3"


use Rack::Static,
  urls: ["/uploads"],
  root: "public"

run API::AppV3
