require 'jwt'

class SampleController < ApplicationController
  def index

  	if params.key?(:name) || params.key?(:pass)
  		exp = Time.now.to_i + 4 * 3600
  		payload = {:name => params[:name], :exp => exp }
  		hmac_secret = '8fda73afc0ef94c85468d6c73ebda27091cde6758c49ba3c362260b778e1b3ae91d33d7b892bf1f91c6197a3cd16d87a'
  		token = JWT.encode payload, hmac_secret, 'HS256'
  		@msg = 'Logged in as ' + params[:name]
  		@token = token
    end

  end
  protect_from_forgery with: :null_session
end