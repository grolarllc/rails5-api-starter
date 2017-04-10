require 'http'

# spec/support/request_helpers.rb
module Requests
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end
  end

  module Auth
    def sign_in(&block)
      @user = FactoryGirl.create :user
      @user.confirm

      @auth_headers = @user.create_new_auth_token
      yield @auth_headers
    end
  end
end

RSpec.configure do |config|
  config.include Requests::JsonHelpers, type: :request
  config.include Requests::Auth, type: :request
end

