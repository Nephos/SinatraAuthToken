module SinatraAuthToken
  module SinatraHelper
    def protect!(params, token = nil)
      return if params["auth_token"] == (token || ::SinatraAuthToken.auth_token)
      halt 403, "Access Forbidden!\n"
    end
  end

  extend self

  @@auth_token = nil

  def auth_token
    @@auth_token
  end

  def init_auth_token!
    @@auth_token = ENV["AUTH_TOKEN"] || SecureRandom.hex(8)
    STDOUT.puts "AUTH_TOKEN IS: #{@@auth_token}"
  end
end

# if __FILE__ == $0
# require "sinatra"
# SinatraAuthToken.init_auth_token!
# helpers SinatraAuthToken::SinatraHelper

# get("/auto") do
#   protect! params
#   "ok"
# end

# get("/manual") do
#   protect! params, "token"
#   "ok"
# end
# end

