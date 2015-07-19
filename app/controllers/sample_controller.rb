require 'jwt'

class SampleController < ApplicationController
  def index

  	if params.key?(:name) || params.key?(:pass)
  		exp = Time.now.to_i + 4 * 3600
  		payload = {:name => params[:name], :exp => exp }
  		hmac_secret = '{your secret key}'
  		token = JWT.encode payload, hmac_secret, 'HS256'
  		@msg = 'Logged in as ' + params[:name]
  		@token = token
    end

  end
  protect_from_forgery with: :null_session
end