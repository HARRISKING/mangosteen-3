require 'rails_helper'

RSpec.describe "ValidationCodes", type: :request do
  describe "create" do
    it "should create a code" do
      post '/api/v1/validation_codes', params: {email: '1906157348@qq.com'} 
      expect(response).to have_http_status 200
    end
  end
end
