require "deploygate/api/version"
require "faraday"
require "faraday_middleware"

module Deploygate
  module Api
    autoload :Invite, "deploygate/api/invite"
    autoload :Push,   "deploygate/api/push"

    BASE_URL = "https://deploygate.com"
  end
end
