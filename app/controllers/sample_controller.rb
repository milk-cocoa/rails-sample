require 'jwt'

class SampleController < ApplicationController
  def index

  	if params.key?(:name) || params.key?(:pass)
  		exp = Time.now.to_i + 4 * 3600
  		payload = {:name => params[:name], :exp => exp }
  		hmac_secret = '643fe2b25f782ac50a94a93887026575364e965afb0b0683047fc0ecd278b9809a4516f301bfa6b99b4ef325bd363511'
  		token = JWT.encode payload, hmac_secret, 'HS256'
  		@msg = 'Logged in as ' + params[:name]
  		@token = token
    end

  end
  protect_from_forgery with: :null_session
end